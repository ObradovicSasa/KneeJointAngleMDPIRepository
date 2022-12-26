%% Kalman filter for the shank IMU
close all

F                                        = imufilter;
F.SampleRate                             = fs;
F.OrientationFormat                      ='Rotation matrix';
F.AccelerometerNoise                     = max(var(accShank(nCalStart1:nCalEnd1,:)*9.81));
F.GyroscopeNoise                         = max(var(omShankCal(nCalStart1:nCalEnd1,:)/180*pi));
F.GyroscopeDriftNoise                    = 2*10^(-9);
F.LinearAccelerationNoise                = max(var(accShank(nStart:nEnd, :)))*9.81;
F.LinearAccelerationDecayFactor          = 0.25;
[orientationShank, angularVelocityShank] = F(accShank(nStart:nEnd,:)*9.81,omShankCal(nStart:nEnd,:)/180*pi);

%% Kalman for the thigh IMU
release(F)
F                                        = imufilter;
F.SampleRate                             = fs;
F.OrientationFormat                      ='Rotation matrix';
F.AccelerometerNoise                     = max(var(accThigh(nCalStart2:nCalEnd2,:)*9.81));
F.GyroscopeNoise                         = max(var(omThighCal(nCalStart2:nCalEnd2,:)/180*pi));
F.GyroscopeDriftNoise                    = 2*10^(-9);
F.LinearAccelerationNoise                = max(var(accThigh(nStart:nEnd, :)))*9.81;
F.LinearAccelerationDecayFactor          = 0.25;
[orientationThigh, angularVelocityThigh] = F(accThigh(nStart:nEnd,:)*9.81,omThighCal(nStart:nEnd,:)/180*pi);

%% Rotation of the vector g with the use of Kalman rotation matrices

[corrOrientationShank, gShankKalman]    = fnOrientationPoravnanje(orientationShank, g0Shank);
[corrOrientationThigh, gThighKalman]    = fnOrientationPoravnanje(orientationThigh, g0Thigh);

%% The comparison of the g vectors from both the first-order polynomial subtraction  
% method and the Kalman filter

figure;
subplot(121); hold on; grid on;
plot(gShankCal, 'b');
plot(gShankKalman, 'g')
xlabel("n")
ylabel("Gravitational acceleration (g)")
legend("Simple calibration g", "Kalman g")
title("Shank")

subplot(122); hold on; grid on;
plot(gThighCal, 'b');
plot(gThighKalman, 'g')
xlabel("n")
ylabel("Gravitational acceleration (g)")
legend("Simple calibration g", "Kalman g")
title("Thigh")

%% Computation of the knee joint angle

gamaKalman      = atan(gShankKalman(:,2)./gShankKalman(:,1));
betaKalman      = abs(atan(gThighKalman(:,2)./gThighKalman(:,1))); 

alfaKalman      = (pi - gamaKalman - betaKalman)*180/pi;

%% Plot of the knee joint angle computed using the Kalman filter

figure; grid on; hold on;
plot(alfaKalman, 'b')
title("Knee joint angle", Interpreter="latex", FontSize=30)
xlabel("$n$", Interpreter="latex", FontSize=30)
