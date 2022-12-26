function [P,C,T,trnsl]=fnLCSSTrnsl(X,Y,epsilon,delta,trnslmin,trnslmax,trnslkorak,komp)
%% funkcija doloci optimalni LCSS z upostevanjem translacije signala Y
%% od trnslmin do trnslmax po koraku trnslkorak

nDimY=size(Y,2);
imax=floor((trnslmax+abs(trnslmin))/trnslkorak)+1;

for i=1:imax  
    Xtr=X;   
    translacija=trnslmin+(i-1)*trnslkorak;
    Xtr(:,komp)=Xtr(:,komp)+translacija;    
    [P,C,T(i)]=fnLCSS(Xtr,Y,epsilon,delta);  
    temp(i,:)=[T(i) abs(translacija) translacija i];
end

tempSort=fnSortM(temp',1);
tempSort(:,find(tempSort(1,:)<tempSort(1,1)))=[];
tempSort=fnSortM(tempSort,2);
iopt=tempSort(4,end);
trnsl=tempSort(3,end);
    
Xtr=X;
Xtr(:,komp)=X(:,komp)+trnsl;
[P,C,T]=fnLCSS(Xtr,Y,epsilon,delta);


