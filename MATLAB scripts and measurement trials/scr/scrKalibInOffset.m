%% Simple gyroscope offset calibration

close all

[omShankOffset, omShankCal]   = fnOffset(omShank, [nCalStart1 nCalEnd1], [0 0 0]);

[omThighOffset, omThighCal]   = fnOffset(omThigh, [nCalStart2 nCalEnd2], [0 0 0]);

%% Initial orientation of the g vector of gravitational acceleration

g0Shank                  = mean(accShank(nStart:nStart+20,:));
g0Thigh                  = mean(accThigh(nStart:nStart+20,:));

%% Rotation of the previously calculated g vector and plot of its projections by each body segment

[gShankCal , rotShankCal]            = fnRotateG(omShankCal(nStart:nEnd,:)./180*pi, t(nStart:nEnd), g0Shank);
[gThighCal , rotThighCal]            = fnRotateG(omThighCal(nStart:nEnd,:)./180*pi, t(nStart:nEnd), g0Thigh);

%% Plot of both the accelerometer and g vector projections for each IMU device

fig4 = figure;
subplot(121)
hold on;
plot(accShank(nStart:nEnd,:))
plot(gShankCal)
grid on


subplot(122)
hold on;
plot(accThigh(nStart:nEnd,:))
plot(gThighCal)
grid on