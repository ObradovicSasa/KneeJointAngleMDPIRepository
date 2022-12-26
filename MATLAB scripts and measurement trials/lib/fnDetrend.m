function xDetrend = fnDetrend(x,j)

if nargin < 2

    s = size(x);
    for i = 1:s(2)
        xEnosmerna = mean(x(1:200,i));
        xDetrend(:,i) = detrend(x(:,i),1);
        xEnosmerna = xEnosmerna-mean(xDetrend(1:200,i));
        xDetrend(:,i) = xDetrend(:,i)+xEnosmerna;
    end

else

    s = size(x);
    for i = 1:s(2)
        xEnosmerna = mean(x(1:200,i));
        xDetrend(:,i) = detrend(x(:,i),j);
        xEnosmerna = xEnosmerna-mean(xDetrend(1:200,i));
        xDetrend(:,i) = xDetrend(:,i)+xEnosmerna;
    end
    
end