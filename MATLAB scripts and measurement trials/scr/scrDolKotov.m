%% Determining the angles soley from the SORA rotation matrices and the readings with the gyro offset compensated
close all

gamaCal     = atan(fnDetrend(gShankCal(:, 2))./ fnDetrend(gShankCal(:, 1)));
% since a linear trend could be present in the projections of g they are detrended before the
% atan function, as the atan function is already a non linear function 
betaCal     = abs(atan(fnDetrend(gThighCal(:, 2))./ fnDetrend(gThighCal(:, 1))));

alfaCal     = (pi - gamaCal - betaCal)*180/pi; % ranges from about 60-150 degrees 
%% Alignment with the use of correlation function -> knee joint angle
shift = fnVskladiKota(alfaKalman(1:1e4),alfaCal(1:1e4));
L = length(alfaKalman(1:1e4));

if shift < L/2 % shift the IMU angles by zamik number of spamles

    alfaKalman       = alfaKalman(shift:end);

else % otherwise shift the Qualisys angles by zamik number of samples

    shift            = fnVskladiKota(alfaCal(1:1e4),alfaKalman(1:1e4));
    alfaCal          = alfaCal(shift:end);

end
%% Alignment with the use of correlation function -> knee joint angle
for i = 1 : 3
    shift1 = fnVskladiKota(alfaKalman(1:1e4),kneeAngleVM(1:1e4));
    L1 = length(alfaKalman(1:1e4));
    
    if shift1 < L1/2 % shift the IMU angles by shift1 number of spamles
    
        alfaCal          = alfaCal(shift1:end);
        alfaKalman       = alfaKalman(shift1:end);
    
    else % otherwise shift the Qualisys angles by shift1 number of samples
    
        shift1          = fnVskladiKota(kneeAngleVM(1:1e4),alfaKalman(1:1e4));
        kneeAngleVM     = kneeAngleVM(shift1:end);
        centralMarker   = centralMarker(shift1:end, 1:3);
    
    end
end
%% Shortening all of the joint angle calculations to the same length 
%(the shortest is used to determine the length)
%Done for the knee joint angles and the central marker for the crank angle 

lengthOfKneeArrays  = [length(alfaCal), length(alfaKalman),length(kneeAngleVM)];
kneeAngleLength     = min(lengthOfKneeArrays);

alfaCal         = alfaCal(1:kneeAngleLength);
alfaKalman      = alfaKalman(1:kneeAngleLength);
kneeAngleVM     = kneeAngleVM(1:kneeAngleLength);
centralMarker   = centralMarker(1:kneeAngleLength, 1:3);

%% LCSS alignment for the differences in clocks between sensor technologies

[LCSSalfaKalman, LCSSalfaCal, LCSSKneeVM, LCSSCMX, LCSSCMZ] = fnWindowingLCSS(5000, 6, 6, alfaKalman, alfaCal, kneeAngleVM, centralMarker(:,1)-mean(centralMarker(:,1)) , centralMarker(:,3)-mean(centralMarker(:,3)));

alfaCalOld       = alfaCal;
alfaCal          = LCSSalfaCal;

alfaKalmanOld    = alfaKalman;
alfaKalman       = LCSSalfaKalman;

kneeAngleVMOld   = kneeAngleVM;
kneeAngleVM      = LCSSKneeVM;

phaseCM = atan2(LCSSCMX, LCSSCMZ);
phaseCM = 360-wrapTo360(phaseCM*180/pi);

%% Plotanje kota dolocenega iz geometrije

figure;
hold on; grid on;
plot(kneeAngleVM, 'b')
plot(alfaCal, 'g')
plot(alfaKalman, 'r')
title("All of the knee joint angles aligned with both the correlation function " + ...
    "and the LCSS algorithm", Interpreter="latex", FontSize=20)
legend("Qualisys", "First order detrend", "Kalman filter")


%% Return the old values if needed
% kneeAngleVM = kneeAngleVMOld;
% 
% alfaKalman = alfaKalmanOld;
% alfaCal = alfaCalOld;

%%
% 
% hold on; grid on;set(gca,'fontsize',40);
% plot(kneeAngleVM, LineWidth=1.5)
% plot(alfaKalman, LineWidth=1.5)