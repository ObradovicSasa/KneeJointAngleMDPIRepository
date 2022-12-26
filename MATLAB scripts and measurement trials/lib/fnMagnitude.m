function xMag = fnMagnitude(x)

for i=1:length(x)
    xMag(i) = sqrt(x(i,1)^2+x(i,2)^2+x(i,3)^2);
end