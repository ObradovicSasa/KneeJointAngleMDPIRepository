function [P,D,C,T]=fnMVM(X,Y)

%% function determines minimal variance matching (MVM)
%% between two input matrices X(lX,n) and Y(lY,n)
%% lX<lY

lX=length(X);
lY=length(Y);
lDiff=lY-lX;

for i=1:lX
    for j=1:lY
        C(i,j)=norm(X(i,:)-Y(j,:));
    end
end

clear P, clear T, clear temp, clear D

for j=1:lY-lX
    D(1,j)=C(1,j);
end
for i=2:lX
    for j=i:lY-lX+i
        D(i,j)=min(D(i-1,i-1:j-1))+C(i,j);
    end
end

P(1:lX,1)=1:lX;
t2=lY;
for i=lX:-1:1
    t1=i;
    temp=find(D(i,t1:t2)==min(D(i,t1:t2)))+t1-1;
    P(i,2)=temp(1);
    T(i)=D(i,P(i,2));
    t2=temp(1)-1;
end

