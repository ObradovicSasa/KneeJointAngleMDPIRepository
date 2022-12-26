function [P,LCSS,T]=fnLCSS(X,Y,epsilon,delta)

%% function determines the longest common subsequnces (LCSS)
%% between two input matrices X(lX,3) and Y(lY,3)
%% epsilon is the allowed difference for two points to be matched for each of their dimensions
%% delta is the maximum jump between two samples

lX=length(X);
lY=length(Y);
LCSS=zeros(lX,lY);
nDim=size(X,2);
epsilonNDim=(epsilon*ones(nDim,1))';

for i=2:lX
    for j=2:lY
        if abs(X(i,:)-Y(j,:))<epsilonNDim & abs(i-j)<delta
            LCSS(i,j)=1+LCSS(i-1,j-1);  
        else
            LCSS(i,j)=max(LCSS(i-1,j),LCSS(i,j-1));
        end
    end
end

clear P, clear T, clear temp

T=LCSS(lX,lY);
t1=lY-delta;
temp=find(LCSS(lX,t1:lY)==max(LCSS(lX,t1:lY)))+t1-1;
iTemp=lX;
jTemp=temp(1);
Pinv=[];

for i=lX-1:-1:1     
    t1=max([jTemp-delta+1,1]);
    temp=find(LCSS(i,t1:jTemp)==max(LCSS(i,t1:jTemp)))+t1-1;
    if LCSS(i,temp(1))<LCSS(iTemp,jTemp)
        Pinv=[Pinv; iTemp jTemp];
    end
    iTemp=i;
    jTemp=temp(1);
    if LCSS(iTemp,jTemp)==0
        break
    end
end

P=Pinv(end:-1:1,:);
T=T/(min([lX lY])-1);
