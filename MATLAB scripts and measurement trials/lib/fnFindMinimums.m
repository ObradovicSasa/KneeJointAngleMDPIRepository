function [minimumIndex] = fnFindMinimums(signal)

    minimums = islocalmin(signal, MinProminence=9);
    tMin = 0:0.01:0.01*(length(signal)-1);
    figure; 
    grid on;
    hold on;
    plot(tMin, signal)
    plot(tMin(minimums), signal(minimums),LineWidth=2)
    
    
    j = 1;
    for i = 1:length(minimums)
        if minimums(i) == 1
            minimumIndex(j)=i;
            j = j+1;
        end
    end
    minimumIndex = minimumIndex';



end