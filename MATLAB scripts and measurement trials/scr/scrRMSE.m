close all

%% Calculation of the cycles for each joint angle and the RMSEs of said angle by crank cycle

[kneeAngleVMIndx, kneeAngleVMPeriod, kneeAngleVMPeriodAvg]    = fnPerioda(kneeAngleVM);


for i = 1:length(kneeAngleVMIndx)-4

    alfaCalVMRMSEbyPeriod(i)        = fnRMSE(alfaCal(kneeAngleVMIndx(i):kneeAngleVMIndx(i+1)), kneeAngleVM(kneeAngleVMIndx(i):kneeAngleVMIndx(i+1)));
    alfaKalmanVMRMSEbyPeriod(i)     = fnRMSE(alfaKalman(kneeAngleVMIndx(i):kneeAngleVMIndx(i+1)), kneeAngleVM(kneeAngleVMIndx(i):kneeAngleVMIndx(i+1)));

end


%% Calculating the interval of 2 standard deviations of the previos RMSEs by period and average RMSE

stdAlfaCalVM          = 2*std(alfaCalVMRMSEbyPeriod);
alfaCalVMRMSE         = mean(alfaCalVMRMSEbyPeriod(1:length(alfaCalVMRMSEbyPeriod))); 

stdAlfaKalmanVM       = 2*std(alfaKalmanVMRMSEbyPeriod);
alfaKalmanVMRMSE      = mean(alfaKalmanVMRMSEbyPeriod(1:length(alfaKalmanVMRMSEbyPeriod)));

%% Storing RMSEs for metadata 

RMSEKneeMetaData    = [string(alfaCalVMRMSE)+" +/- "+string(stdAlfaCalVM); string(alfaKalmanVMRMSE)+" +/- "+string(stdAlfaKalmanVM)]';

%% Plot of the RMSE through the entire measurement (the red dashed line) 
% and the RMSE by each period (the blue line) with respect to the optical 
% measurement with the VM
%
% The knee joint angle

figure;
subplot(211)
hold on
plot(alfaCalVMRMSEbyPeriod, LineWidth=2)
plot(linspace(alfaCalVMRMSE,alfaCalVMRMSE,length(alfaCalVMRMSEbyPeriod)),'--', LineWidth=2)
grid on
set(gca,'fontsize',30)
xlabel("Crank cycle", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)

title("RMSE of knee joint angle by period with virtual marker", 'interpreter', 'latex', 'FontSize', 30);

subplot(212)
hold on
plot(alfaKalmanVMRMSEbyPeriod, LineWidth=2)
plot(linspace(alfaKalmanVMRMSE,alfaKalmanVMRMSE,length(alfaKalmanVMRMSEbyPeriod)),'--', LineWidth=2)
grid on
set(gca,'fontsize',30)
xlabel("Crank cycle", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)

%% Calculating the mean of the maximum joint angles from the optical measurements +- an interval of 2 standard deviations

kneeAngleVMMaxIndx  = fnFindMaximums(kneeAngleVM);

kneeAngleVMMaximums = kneeAngleVM(kneeAngleVMMaxIndx);

display("The mean of the measured maximum knee joint angle:")
maxKneeAngleMean    = mean(kneeAngleVMMaximums)
display(' +- ');
stDevMaxKneeAngle   = 2*std(kneeAngleVMMaximums)

%% Calculating the mean of the minimum joint angles from the optical measurements +- an interval of 2 standard deviations

kneeAngleVMMinIndx  = fnFindMinimums(kneeAngleVM);

kneeAngleVMMinimums = kneeAngleVM(kneeAngleVMMinIndx);

display('The mean of the measured minimum knee joint angle:');
minKneeAngleMean    = mean(kneeAngleVMMinimums(1:end-2))
display(' +- ');
stDevMinKneeAngle   = 2*std(kneeAngleVMMinimums(1:end-2))

%% Calculating the cadence
display('The mean of the cadence is: ');
meanKad = mean(kneeAngleVMPeriod(1:end-4))
display(' +- ');
stdKad = 2*std(kneeAngleVMPeriod(1:end-4))

%% Storing the min/max angles and cadence for metadata 

cadenceMetaData         = string(meanKad)+" +/- "+string(stdKad);
maximumKneeMetaData     = string(maxKneeAngleMean)+" +/- "+string(stDevMaxKneeAngle);
minimumKneeMetaData     = string(minKneeAngleMean)+" +/- "+string(stDevMinKneeAngle);

%% Plot of Kalman and Qualisys VM with respect to the crank angle

phaseMax   = fnFindMaximums(phaseCM);

%%
figure;

ymax = max([alfaKalman(phaseMax(1):phaseMax(end)), kneeAngleVM(phaseMax(1):phaseMax(end))]);
ymin = min([alfaKalman(phaseMax(1):phaseMax(end)), kneeAngleVM(phaseMax(1):phaseMax(end))]);

subplot(121);
hold on;
grid on;
xlim([0 360])
ylim([min(ymin) max(ymax)])
c = parula(length(phaseMax));
for i = 50:length(phaseMax)-5
    plot(phaseCM(phaseMax(i)+1:phaseMax(i+1)),alfaKalman(phaseMax(i)+1:phaseMax(i+1)),'color', c(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',30)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{\textnormal{(IMU)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)


subplot(122);
hold on;
grid on;
xlim([0 360])
ylim([min(ymin) max(ymax)])
d = parula(length(phaseMax));
for i = 50:length(phaseMax)-5
    plot(phaseCM(phaseMax(i)+1:phaseMax(i+1)),kneeAngleVM(phaseMax(i)+1:phaseMax(i+1)),'color', d(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',30)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{\textnormal{(ref)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)

%% Saving all period evaluation data into .mat

eval(strcat('alfaKalmanVMRMSEbyPeriod', 'K', num2str(selectCandidate), 'M', num2str(selectMeasurement), '=', 'alfaKalmanVMRMSEbyPeriod',';'))
eval(strcat('alfaCalVMRMSEbyPeriod', 'K', num2str(selectCandidate), 'M', num2str(selectMeasurement), '=', 'alfaCalVMRMSEbyPeriod',';'))

eval(strcat('save("data/Meritve/K',  num2str(selectCandidate),'/RMSEbyPeriodM', ...
    num2str(selectMeasurement), '.mat","','alfaKalmanVMRMSEbyPeriod', 'K', ...
    num2str(selectCandidate), 'M', num2str(selectMeasurement), '",','"alfaCalVMRMSEbyPeriod', 'K', ...
    num2str(selectCandidate), 'M', num2str(selectMeasurement),'");'))


eval(strcat('save("data/Meritve/K',  num2str(selectCandidate),'/RMSEbyPeriodM', ...
    num2str(selectMeasurement), '.mat","','alfaKalmanVMRMSEbyPeriod', 'K', ...
    num2str(selectCandidate), 'M', num2str(selectMeasurement), '",','"alfaCalVMRMSEbyPeriod', 'K', ...
    num2str(selectCandidate), 'M', num2str(selectMeasurement),'");'))

eval(strcat('save("data/Meritve/K',  num2str(selectCandidate),'/KneeCrankAngle', ...
    num2str(selectMeasurement), '.mat",','"kneeAngleVM",', ...
    '"phaseCM",','"phaseMax",','"ymin",','"ymax");'))

