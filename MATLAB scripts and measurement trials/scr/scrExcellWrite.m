close all

if selectCandidate == 1
    if selectMeasurement == 2
        K = '4';
    elseif selectMeasurement == 1
        K = '5';
    end
elseif selectCandidate == 2
    if selectMeasurement == 2
        K = '6';
    elseif selectMeasurement == 1
        K = '7';
    end
elseif selectCandidate == 3
    if selectMeasurement == 2
        K = '8';
    elseif selectMeasurement == 1
        K = '9';
    end
elseif selectCandidate == 4
    if selectMeasurement == 2
        K = '10';
    elseif selectMeasurement == 1
        K = '11';
    end
elseif selectCandidate == 5
    if selectMeasurement == 2
        K = '12';
    elseif selectMeasurement == 1
        K = '13';
    end
elseif selectCandidate == 6
    if selectMeasurement == 2
        K = '14';
    elseif selectMeasurement == 1
        K = '15';
    end
elseif selectCandidate == 7
    if selectMeasurement == 2
        K = '16';
    elseif selectMeasurement == 1
        K = '17';
    end
end
%%
writematrix(RMSEKneeMetaData,filename,'Sheet',1,'Range',strcat('E', K,':F',K));
writematrix(cadenceMetaData,filename,'Sheet',1,'Range',strcat('G', K, ':G', K));
writematrix(cadenceRPMMetaData,filename,'Sheet',1,'Range',strcat('H', K, ':H', K));
writematrix(maximumKneeMetaData,filename,'Sheet',1,'Range',strcat('I', K, ':I', K));
writematrix(minimumKneeMetaData,filename,'Sheet',1,'Range',strcat('J', K, ':J', K));
