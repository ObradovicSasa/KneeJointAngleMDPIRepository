load data/Meritve/kneeJointAndCrankAngle.mat
close all
figure;

ymin = min([ymin5 ymin20]);
ymax = max([ymax5 ymax20]);

subplot(221);
hold on;
grid on;
xlim([0 360])
ylim([ymin ymax])
c = parula(length(phaseMax5min));
for i = 2:length(phaseMax5min)-2
    plot(phaseCM5min(phaseMax5min(i)+1:phaseMax5min(i+1)),alfaKalman5min(phaseMax5min(i)+1:phaseMax5min(i+1)),'color', c(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',20)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{{(IMU)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)


subplot(222);
hold on;
grid on;
xlim([0 360])
ylim([ymin ymax])
d = parula(length(phaseMax5min));
for i = 2:length(phaseMax5min)-2
    plot(phaseCM5min(phaseMax5min(i)+1:phaseMax5min(i+1)),kneeAngleVM5min(phaseMax5min(i)+1:phaseMax5min(i+1)),'color', c(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',20)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{{(ref)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)

subplot(223);
hold on;
grid on;
xlim([0 360])
ylim([ymin ymax])
d = parula(length(phaseMax20min));
for i = 2:length(phaseMax20min)-2
    plot(phaseCM20min(phaseMax20min(i)+1:phaseMax20min(i+1)),alfaKalman20min(phaseMax20min(i)+1:phaseMax20min(i+1)),'color', d(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',20)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{{(IMU)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)



subplot(224);
hold on;
grid on;
xlim([0 360])
ylim([ymin ymax])
for i = 2:length(phaseMax20min)-2
    plot(phaseCM20min(phaseMax20min(i)+1:phaseMax20min(i+1)),kneeAngleVM20min(phaseMax20min(i)+1:phaseMax20min(i+1)),'color', d(i,:), 'LineWidth',1.5)
end
set(gca,'fontsize',20)
xlabel("$\psi$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize',30)
ylabel("$\alpha^{{(ref)}}$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)
