function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if length(x) ~= length(y)
    error('You must have the same number of indendent and dependent variables')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
s = length(y);
% How we calculate the Interquertile range
P1 = floor((s+1)/4);
P3 = floor((3*s+3)/4);
% These are the Interquartile ranges
Q1 = sortedY(P1);
Q3 = sortedY(P3);
IQR = Q3-Q1;
r = IQR *1.5;
% Finds any outliers in the data
y1 = zeros(1,s);
x1 = zeros(1,s);
outliers = 0;
for i=1:s
    if sortedY(i) >= Q1-r && sortedY(i) <= Q3+r
        y1(i) = sortedY(i);
        x1(i) = sortedX(i);
    else
        outliers = outliers+1;
    end
end

fY = zeros(1,s-outliers);
fX = zeros(1,s-outliers);

% Then puts all of the shorted data into an array with the correct size
for i = 1:length(fY)
    fY(i) = y1(i);
    fX(i) = x1(i);
end

n = length(fY);
ybar = mean(fY); % Average of all the y values
xbar = mean(fX);  % Average of all the x values
sst = 0;     % the total Some of the Squares
% Calculates the total sum of the squares
for i = 1:n
    sst = sst +(fY(i)-ybar).^2;
end
% Sumation of all the X and Y values multiplied by each other
xy = 0;
for i = 1:n
   xy = (fX(i).*fY(i))+xy;
end
% sumation of all the x values and y values
xi = xbar*n;
yi = ybar*n;

% Summation of all X values squared
x2 = 0;
for i = 1:n
    x2 = x2+(x(i)).^2;
end
% Caculates the slope and intercept for the regression line
a1 = ((n.*xy)-xi.*yi)/(n.*x2-xi.^2);    % This the slope of the regression line
a0 = ybar - a1*xbar;

slope = a1;
intercept = a0;
z = @(x) a0 + a1*x;
% Calculates the Sum of the Squares of residule
ssr = 0;
for i = 1:n
    ssr = ssr + (fY(i)-z(fX(i))).^2;
end

Rsquared = 1-ssr./sst;

end

