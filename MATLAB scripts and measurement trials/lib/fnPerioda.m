function [indxPeriod, velikostPeriod, avgPeriod] = fnPerioda(meritev)
    % Funkcija poisce indexe vseh period za dano meritev, ter shrani
    % velikosti period za kasnejse dolocanje st. dev kot tudi povprecne
    % vrednosti period
    [meritevMax, meritevMaxIndx] = findpeaks(meritev, 'MinPeakProminence', 8);
    
    j = 1;
    for i = 1:length(meritevMaxIndx)-1
        velikostPeriod(j, 1) = meritevMaxIndx(i+1,1) - meritevMaxIndx(i,1);
        j = j+1;
    end

    indxPeriod = meritevMaxIndx;
    avgPeriod = mean(velikostPeriod);

    tPeriod = 0:0.01:0.01*(length(meritev)-1);
    figure; 
    grid on;
    hold on;
    plot(tPeriod, meritev, LineWidth=1)
    plot(tPeriod(indxPeriod), meritev(indxPeriod),LineWidth=2)

    figure;hold on; grid on;
    plot(velikostPeriod)
    plot(linspace(avgPeriod, avgPeriod, length(velikostPeriod)), LineStyle="--", LineWidth=2)


end