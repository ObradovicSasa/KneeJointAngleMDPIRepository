function RMSE = fnRMSE(x, y)

if length(x) == length(y)
RMSE = sqrt(sum((x-y).^2)/length(x));
else
    disp('x in y morata biti enake dolzine')
end

end