function [uBest, phiBest, errBest, R0] = fnBruteForceR(RQ, RIMU, N1, N2, N3)


errBest = 1e6; uBest = [1 1 1]; phiBest = 0; % zacetni best case scenario

for phi = -5:0.05:5
    for ux = 0:0.05:1
        for uy = 0:0.2:1
            for uz = 0:0.2:1
                u = [ux uy uz]; u = u/norm(u); 
                R0temp = rotationmat3D(phi/180*pi,u);

                RQinIMU = R0temp*RQ(:,:,N1)/R0temp;
                err1 = RIMU(:,:,N1) - RQinIMU;
            
                RQinIMU = R0temp*RQ(:,:,N2)/R0temp;
                err2 = RIMU(:,:,N2) - RQinIMU;
            
                RQinIMU = R0temp*RQ(:,:,N3)/R0temp;
                err3 = RIMU(:,:,N3) - RQinIMU;
            
                errTotal = sum(err1(:).^2) + sum(err2(:).^2) + sum(err3(:).^2);
%                 errTotal = sum(err1(:).^2);
            
                if errTotal < errBest
                    uBest = u;
                    phiBest = phi;
                    errBest = errTotal;
                end
            end
        end
    end
end

R0 = rotationmat3D(phiBest/180*pi,uBest);
disp('Rotacijska matrika, ki izpolnjuje pogoj R0*RQ = RS v referencnem ziksilonu je')
disp(R0)

for i = 1:length(RQ)
    rotVMComp(:,:,i) = R0*RQ(:,:,i)/R0;
end

figure;
subplot(311), plot(squeeze(rotVMComp(:,1,:))'), hold on
plot(squeeze(RIMU(:,1,:))')
subplot(312), plot(squeeze(rotVMComp(:,2,:))'), hold on
plot(squeeze(RIMU(:,2,:))')
subplot(313), plot(squeeze(rotVMComp(:,3,:))'), hold on
plot(squeeze(RIMU(:,3,:))')

end


