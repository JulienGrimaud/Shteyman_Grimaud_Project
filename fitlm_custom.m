function [a,b,Rsq] = fitlm_custom(x,y)
%This function is a substitute for fitlm.
%
%Inputs: x and y are two vectors of the same dimension, containing the
%  x-axis and y-axis values of the dots on which you wish to perform a
%  linear regression. Both inputs need to be of the same size.
%
%Outputs: a is the slope of the regression, b is the intercept, Rsq is the
%  coefficient of determination (a.k.a. R squared).
%
%Example:
%  age = [20 23 21 20 24 25 19 20 20 21];
%  grade = [89 95 90 85 99 98 80 81 91 87];
%  [a b r] = fitlm_custom(age,grade);


%If the inputs are horizontal, then we make them vertical.
if size(x,1)==1
    x = x';
    y = y';
end

%Calculate the slope and intercept.
X = [ones(length(x),1) x];
M = X\y;
a = M(2);
b = M(1);

%Calculate the coefficient of determination.
yCalc = X*M;
Rsq = 1 - sum((y - yCalc).^2)/sum((y - mean(y)).^2);


end
