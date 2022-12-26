%% Determining the knee joint angle directly from the Qualisys measurements

if isstring(selectCandidate)

    if strcmp(selectCandidate, "Rot1")
        
        load (strcat(meritvePath,eval(strcat('Rot1.Q'))));
        q = rotationMatrixAlignment1;
    
    elseif strcmp(selectCandidate, "Rot2")
    
        load (strcat(meritvePath,eval(strcat('Rot2.Q'))));
        q = rotationMatrixAlignment2;
    end

else
    
        load (strcat(meritvePath,eval(strcat('K',num2str(selectCandidate),'.Q.M',num2str(selectMeasurement)))));
        
        if selectCandidate == 1 || selectCandidate == 2 || selectCandidate == 3
        
            if selectMeasurement == 1 
                q = eval(strcat('K',num2str(selectCandidate),'_5min'));
            else
                q = eval(strcat('K',num2str(selectCandidate),'_20min'));
            end
        
        elseif selectCandidate == 6 && selectMeasurement == 2

            q = eval(strcat('K',num2str(selectCandidate),'_M', num2str(selectMeasurement),'2'));

        else
        
            q = eval(strcat('K',num2str(selectCandidate),'_M', num2str(selectMeasurement)));
        
        end
        centralMarker = squeeze(q.Trajectories.Labeled.Data(13, 1:3, :))';
    
end


fsQ = q.FrameRate; % Sampling frequency

beforeRotShankVM    = squeeze(q.RigidBodies.Rotations(4,:,:)); 
beforeRotThighVM    = squeeze(q.RigidBodies.Rotations(5,:,:)); 

tQ = (1:length(beforeRotShankVM))/fsQ;

% The rest of this section searches for missing values in the Qualisys
% measurements, and in turn fills them with the use of linear
% interpolation. The technique works on short amount of samples.

k1VM = find(~isnan(beforeRotShankVM(1,:)));
k2VM = find(~isnan(beforeRotThighVM(1,:)));


for i = 1:9

    beforeRotShankVM(i,:)    = (interp1(tQ(k1VM),beforeRotShankVM(i, k1VM),tQ(1:end)));
    beforeRotThighVM(i,:)    = (interp1(tQ(k2VM),beforeRotThighVM(i, k2VM),tQ(1:end)));

end

 
for i = 1:length(beforeRotShankVM)

    % interpolated rotation matrices with a virtual marker
    rotShankVM(:,:,i)   = [beforeRotShankVM(1:3, i) beforeRotShankVM(4:6, i) beforeRotShankVM(7:9, i)];
    rotThighVM(:,:,i)   = [beforeRotThighVM(1:3, i) beforeRotThighVM(4:6, i) beforeRotThighVM(7:9, i)];

end


%% Alignment of coordinate frames
if isstring(selectCandidate)

else

    if selectCandidate == 1 || selectCandidate == 3 || selectCandidate == 4 || selectCandidate == 5
        
        load (strcat(rotMatK3))
    
    elseif selectCandidate == 2
    
        load (strcat(rotMat15))
    
    elseif selectCandidate == 6 || selectCandidate == 7
    
        load (strcat(rotMat67))
    
    end
    
    for i = 1:length(rotShankVM(1,1,:))
        
        rotShankVM(:,:,i)     =  R0Shank*rotShankVM(:,:,i)*inv(R0Shank);
        rotThighVM(:,:,i)     =  R0Thigh*rotThighVM(:,:,i)*inv(R0Thigh);
    
    end
    
    
    display("Done!")

end

%% Calculating the angle by comparing the coordinate frames of each rigid body


[kneeAngleVM, kneeVectorVM,connRotKneeVM] = fnConnectingRotationMatrices(rotThighVM, rotShankVM);

kneeAngleVM     = 180-(kneeAngleVM*180/pi);

angles = figure;
grid on; hold on;
plot(kneeAngleVM)

[xQStart, yQStart]  = ginput(1);
xQStart             = round(xQStart);
close(angles)
nQStart             = xQStart(1);

kneeAngleVM         = kneeAngleVM(nQStart:end);

if isstring(selectCandidate)

else
centralMarker       = centralMarker(nQStart:end, 1:3);
end

%%
figure;
grid on; hold on;
plot(kneeAngleVM)
