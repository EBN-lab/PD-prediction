function [ x ] = MAE( Ypred,Y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
e=abs(Ypred-Y);
e=e(e>0);
x=sum(e)/size(e,1);

end

