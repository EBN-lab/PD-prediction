function [ result ] = assesment( Ypred,Y )
%   Detailed explanation goes here

result={};
result.rmse=sqrt(mean((Y-Ypred).^2));
result.mae=MAE(Y,Ypred);
[result.corr,result.pvalue]=corr(Y,Ypred);
result.r2=rsquare(Y,Ypred);

end

