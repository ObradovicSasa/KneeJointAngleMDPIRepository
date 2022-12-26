% close all

if measurementType == 1
    load data/Meritve/RMSE5min.mat
else
    load data/Meritve/RMSE20min.mat
end

%% 

for i = 1:7
    if i ==5 && measurementType == 2
        continue;
    else
        eval(strcat('alfaCal10LastMeanK', num2str(i),'M', num2str(measurementType),'=round(mean(alfaCalVMRMSEbyPeriodK', num2str(i),'M', num2str(measurementType),'(end-12:end-2)),2);'));
        eval(strcat('alfaCal10LastStDevK', num2str(i),'M', num2str(measurementType),'=round(2*std(alfaCalVMRMSEbyPeriodK', num2str(i),'M', num2str(measurementType),'(end-12:end-2)),2);'));

        eval(strcat('alfaKalman10LastMeanK', num2str(i),'M', num2str(measurementType),'=round(mean(alfaKalmanVMRMSEbyPeriodK', num2str(i),'M', num2str(measurementType),'(end-12:end-2)),2);'));
        eval(strcat('alfaKalman10LastStDevK', num2str(i),'M', num2str(measurementType),'=round(2*std(alfaKalmanVMRMSEbyPeriodK', num2str(i),'M', num2str(measurementType),'(end-12:end-2)),2);'));;
    end
end

%% Calculating the threshold and the valid parts of the measurements :) ->  KALMAN 
if measurementType == 1

    alfaVMRMSEKalmanMean = [alfaKalmanVMRMSEbyPeriodK1M1 alfaKalmanVMRMSEbyPeriodK2M1 alfaKalmanVMRMSEbyPeriodK3M1 alfaKalmanVMRMSEbyPeriodK4M1 ...
        alfaKalmanVMRMSEbyPeriodK5M1 alfaKalmanVMRMSEbyPeriodK6M1 alfaKalmanVMRMSEbyPeriodK7M1];

elseif measurementType == 2

    alfaVMRMSEKalmanMean = [alfaKalmanVMRMSEbyPeriodK1M2 alfaKalmanVMRMSEbyPeriodK2M2 alfaKalmanVMRMSEbyPeriodK3M2 alfaKalmanVMRMSEbyPeriodK4M2 ...
     alfaKalmanVMRMSEbyPeriodK6M2 alfaKalmanVMRMSEbyPeriodK7M2];

end

meanAlfaKalmanRMSE      = mean(alfaVMRMSEKalmanMean);
stdAlfaKalmanRMSE       = 2*std(alfaVMRMSEKalmanMean);

disp(meanAlfaKalmanRMSE)
disp(stdAlfaKalmanRMSE)

alfaKalmanMeanRMSE = linspace(meanAlfaKalmanRMSE,meanAlfaKalmanRMSE,length(alfaVMRMSEKalmanMean));

%% Calculating the threshold and the valid parts of the measurements :) ->  First-order polynomial
if measurementType == 1
    alfaVMRMSECalMean = [alfaCalVMRMSEbyPeriodK1M1 alfaCalVMRMSEbyPeriodK2M1 alfaCalVMRMSEbyPeriodK3M1 alfaCalVMRMSEbyPeriodK4M1 ...
        alfaCalVMRMSEbyPeriodK5M1 alfaCalVMRMSEbyPeriodK6M1 alfaCalVMRMSEbyPeriodK7M1];
elseif measurementType == 2
    alfaVMRMSECalMean = [alfaCalVMRMSEbyPeriodK1M2 alfaCalVMRMSEbyPeriodK2M2 alfaCalVMRMSEbyPeriodK3M2 alfaCalVMRMSEbyPeriodK4M2 ...
     alfaCalVMRMSEbyPeriodK6M2 alfaCalVMRMSEbyPeriodK7M2];
end

meanAlfaCalRMSE      = mean(alfaVMRMSECalMean);
stdAlfaCalRMSE       = 2*std(alfaVMRMSECalMean);

disp(meanAlfaCalRMSE)
disp(stdAlfaCalRMSE)

alfaCalMeanRMSE = linspace(meanAlfaCalRMSE,meanAlfaCalRMSE,length(alfaVMRMSECalMean));

%% Shortening to same length

for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else
        lengthOfVMRMSE(i) = length(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M', num2str(measurementType))));
    end
end

lengthOfVMRMSE = nonzeros(lengthOfVMRMSE);

len = min(lengthOfVMRMSE);

for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else

        eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType) ,' =', 'alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType) ,'(1:len);'))
        eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType) ,' =', 'alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType) ,'(1:len);'))

    end
end

alfaKalmanMeanRMSE  = alfaKalmanMeanRMSE(1:len);
alfaCalMeanRMSE     = alfaCalMeanRMSE(1:len);

%% Plot of everything above -> Solely Kalman mean :)
b = turbo(30);
r = autumn(15);


figure;
subplot(211)
hold on;grid on;
for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else
        if mean(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType)))) > meanAlfaKalmanRMSE  
            plot(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'r',LineWidth=1.5)
        else
            plot(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'b',LineWidth=1.5)
        end
    end
end
plot(alfaKalmanMeanRMSE, 'color', 'g', lineWidth=3, LineStyle='--')
set(gca,'fontsize',20)
xlabel("cycles", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)
xlim([0 length(eval(strcat('alfaKalmanVMRMSEbyPeriodK1M', num2str(measurementType))))])
title("First-order polynomial drift compensation", 'interpreter', 'latex', 'FontSize',30)

subplot(212)
hold on;grid on;
for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else
        if mean(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType)))) > meanAlfaKalmanRMSE  
            plot(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'r',LineWidth=1.5)
        else
            plot(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'b',LineWidth=1.5)
        end
    end
end
plot(alfaKalmanMeanRMSE, 'color', 'g', lineWidth=3, LineStyle='--')
set(gca,'fontsize',20)
xlabel("cycles", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)
xlim([0 length(eval(strcat('alfaKalmanVMRMSEbyPeriodK1M', num2str(measurementType))))])
title("Kalman filter", 'interpreter', 'latex', 'FontSize',30)

%% Plot of everything above -> Both Kalman and first order polynomial detrend mean ;)

figure;
subplot(211)
hold on;grid on;
for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else
        if mean(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType)))) > meanAlfaCalRMSE  
            plot(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'r',LineWidth=1.5)
        else
            plot(eval(strcat('alfaCalVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'b',LineWidth=1.5)
        end
    end
end
plot(alfaCalMeanRMSE, 'color', 'g', lineWidth=3, LineStyle='--')
set(gca,'fontsize',20)
xlabel("cycles", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)
xlim([0 length(eval(strcat('alfaKalmanVMRMSEbyPeriodK1M', num2str(measurementType))))])
title("First-order polynomial drift compensation", 'interpreter', 'latex', 'FontSize',30)

subplot(212)
hold on;grid on;
for i = 1:7
    if i == 5 && measurementType == 2
        continue;
    else
        if mean(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType)))) > meanAlfaKalmanRMSE  
            plot(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'r',LineWidth=1.5)
        else
            plot(eval(strcat('alfaKalmanVMRMSEbyPeriodK', num2str(i), 'M',num2str(measurementType))),  'color', 'b',LineWidth=1.5)
        end
    end
end
plot(alfaKalmanMeanRMSE, 'color', 'g', lineWidth=3, LineStyle='--')
set(gca,'fontsize',20)
xlabel("cycles", 'interpreter', 'latex', 'FontSize',30)
ylabel("$RMSE$ $[^{\circ}]$", 'interpreter', 'latex', 'FontSize', 30)
xlim([0 length(eval(strcat('alfaKalmanVMRMSEbyPeriodK1M', num2str(measurementType))))])
title("Kalman filter", 'interpreter', 'latex', 'FontSize',30)
