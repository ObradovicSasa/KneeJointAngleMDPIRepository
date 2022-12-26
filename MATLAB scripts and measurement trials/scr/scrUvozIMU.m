%% IMU Data Import
warning("off", "all")
if isstring(selectCandidate)
    
    if strcmp(selectCandidate, "Rot1")

        %SHANK  - > Sensor 5
        ACCDATA_1      = readtable(strcat(meritvePath,Rot1.IMU.G.Acc));
        GYRODATA_1     = readtable(strcat(meritvePath,Rot1.IMU.G.Gyro));
        %THIGH  - > Sensor 1
        ACCDATA_2      = readtable(strcat(meritvePath,Rot1.IMU.S.Acc));
        GYRODATA_2     = readtable(strcat(meritvePath,Rot1.IMU.S.Gyro));


    elseif strcmp(selectCandidate, "Rot2")
    
        %SHANK  - > Sensor 5
        ACCDATA_1      = readtable(strcat(meritvePath,Rot2.IMU.G.Acc));
        GYRODATA_1     = readtable(strcat(meritvePath,Rot2.IMU.G.Gyro));
        %THIGH  - > Sensor 1
        ACCDATA_2      = readtable(strcat(meritvePath,Rot2.IMU.S.Acc));
        GYRODATA_2     = readtable(strcat(meritvePath,Rot2.IMU.S.Gyro));

    end
else
    if selectCandidate == 1

        %SHANK  - > Sensor 5
        ACCDATA_1      = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.Acc'))));
        GYRODATA_1     = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.Gyro'))));
        %THIGH  - > Sensor 1
        ACCDATA_2      = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.Acc'))));
        GYRODATA_2     = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.Gyro'))));

    else
    
        %SHANK  - > Sensor 5
        ACCDATA_1      = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.Acc'))));
        GYRODATA_1     = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.Gyro'))));
        %THIGH  - > Sensor 1
        ACCDATA_2      = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.Acc'))));
        GYRODATA_2     = readtable(strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.Gyro'))));
 
    end

end
warning("on", "all")
%%

if isstring(selectCandidate)

    if selectCandidate =="Rot1"
    
        if ~isempty(Rot1.IMU.S.nOffset)

            nCal1           = eval(strcat('Rot1.IMU.G.nOffset'));
            nCalStart1      = nCal1(1);
            nCalEnd1        = nCal1(2);
            
            nCal2           = eval(strcat('Rot1.IMU.S.nOffset'));
            nCalStart2      = nCal2(1);
            nCalEnd2        = nCal2(2);

            nStartEnd       = eval(strcat('Rot1.IMU.nStartEnd'));
            nStart          = nStartEnd(1);
            nEnd            = nStartEnd(2);
    
        end
    
    elseif selectCandidate == "Rot2"
    
        if ~isempty(Rot2.IMU.S.nOffset)
    
            nCal1           = eval(strcat('Rot2.IMU.G.nOffset'));
            nCalStart1      = nCal1(1);
            nCalEnd1        = nCal1(2);
            
            nCal2           = eval(strcat('Rot2.IMU.S.nOffset'));
            nCalStart2      = nCal2(1);
            nCalEnd2        = nCal2(2);

            nStartEnd       = eval(strcat('Rot2.IMU.nStartEnd'));
            nStart          = nStartEnd(1);
            nEnd            = nStartEnd(2);
    
    
        end

    end

else

    if ~isempty(eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.nOffset')))

        nCal1           = eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.G.nOffset'));
        nCalStart1      = nCal1(1);
        nCalEnd1        = nCal1(2);

    end

    if ~isempty(eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.nOffset')))

        nCal2           = eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.S.nOffset'));
        nCalStart2      = nCal2(1);
        nCalEnd2        = nCal2(2);
    
    end

    if ~isempty(eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.nStartEnd')))
        
        nStartEnd       = eval(strcat('K',num2str(selectCandidate),'.IMU.M',num2str(selectMeasurement),'.nStartEnd'));
        nStart          = nStartEnd(1);
        nEnd            = nStartEnd(2);

    end

end

%%

[accShank, omShank, accThigh, omThigh, t, t120] = fnSyncAccOmMW2S(ACCDATA_1, GYRODATA_1, ACCDATA_2, GYRODATA_2, fs);

%% Plot of the IMU readings

figure;
subplot(211),plot(t/60,accShank,t/60, accThigh)
xlabel("t [min]")
ylabel("Accelerometers [g]")
grid on

subplot(212),plot(t/60,omShank, t/60, omThigh)
xlabel("t [min]")
ylabel("Gyroscopes [deg/s]")
grid on
        
