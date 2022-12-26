function maximumIndexes = fnFindMaximums(signal)

    [measurementMaximum, maximumIndexes] = findpeaks(signal, 'MinPeakProminence', 10);


    tMax = 0:0.01:0.01*(length(signal)-1);
    figure; 
    grid on;
    hold on;
    plot(tMax, signal, LineWidth=1.5)
    plot(tMax(maximumIndexes), signal(maximumIndexes),LineWidth=2)
    set(gca,'fontsize',40)

end