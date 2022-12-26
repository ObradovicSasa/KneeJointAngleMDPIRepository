%% transformation into local intrinsic coordinate frame of the rigid body 

poravRotShankVM = [];
poravRotThighVM = [];


for i = 1:length(rotThigh)

    poravRotThighVM(:,:,i)  = mean(rotThighVM(:,:,1:50), 3)\rotThighVM(:,:,i);
    poravRotShankVM(:,:,i)  = mean(rotShankVM(:,:,1:50), 3)\rotShankVM(:,:,i);
    r = inv(x)*x
end


%%
for i = 1:4 % aligning the rotation matrices with the correlation function

    align1 = fnVskladiKota(squeeze(poravRotShankVM(1,1,1:2e3)),squeeze(corrOrientationShank(1,1,1:2e3)));
    L1 = length(poravRotShankVM(1:2e3));
    
    if align1 < L1/2
    
        poravRotShankVM     = poravRotShankVM(:,:,align1:end);
        poravRotThighVM     = poravRotThighVM(:,:,align1:end);
    
    else
    
        align1 = fnVskladiKota(squeeze(corrOrientationShank(1,1,1:2e3)),squeeze(poravRotShankVM(1,1,1:2e3)));
        corrOrientationShank    = corrOrientationShank(:,:,align1:end);
        corrOrientationThigh    = corrOrientationThigh(:,:,align1:end);
    
    end

end

%%

corrOrientationShank    = pagetranspose(corrOrientationShank);
corrOrientationThigh    = pagetranspose(corrOrientationThigh);

%%

alignmentFigure = figure;
subplot(211); hold on; grid on;
plot(squeeze(poravRotShankVM(2,:,:))')
plot(squeeze(corrOrientationShank(2,:,:))')

subplot(212); hold on; grid on;
plot(squeeze(poravRotThighVM(2,:,:))')
plot(squeeze(corrOrientationThigh(2,:,:))')

[xN, yN] = ginput(3);
xN = round(xN);
close(alignmentFigure)
N1 = xN(1);
N2 = xN(2);
N3 = xN(3);

%% shortening of the rotation matrices to the same length

len = min(length(poravRotShankVM), length(corrOrientationShank));

corrOrientationShank = corrOrientationShank(:,:,1:len);
corrOrientationThigh = corrOrientationThigh(:,:,1:len);

poravRotShankVM = poravRotShankVM(:,:,1:len);
poravRotThighVM = poravRotThighVM(:,:,1:len);


%% Brute force connecting rotation matrices -> rotating Qualisys into IMU intrinsic frame

warning("off","all")
[uBestShank, phiBestShank, errBestShank, R0Shank] = fnBruteForceR(poravRotShankVM,corrOrientationShank, N1, N2, N3);
[uBestThigh, phiBestThigh, errBestThigh, R0Thigh] = fnBruteForceR(poravRotThighVM,corrOrientationThigh, N1, N2, N3);
warning("on", "all")

%%
if connSave == true
save(saveLocation, 'R0Shank', 'R0Thigh', 'phiBestShank', 'phiBestThigh', 'uBestShank', 'uBestThigh', 'errBestShank', 'errBestThigh')
disp("Done!")
else

end
