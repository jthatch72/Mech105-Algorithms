function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
% falsePosition finds the root of a function using false position method
% [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, p1, p2,...)
%   Uses False Position Root Finding Method to calculate the root of a
%   functon with two initial guesses that bracket the root of the function
% Input:
%   func = name of the function being evaluated
%   xl = initial lower guess
%   xu = initial upper guess
%   es = desried realtive error (Default to 0.0001%)
%   maxit = maximum allowed iterations (Default to 200)
% Output:
%   root = the estimated root location
%   fx = the function evaluated at the root location
%   ea = the approximate relative error (%)
%   iter = the number of iterations that were performed

% To check that all variables are correct
if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxit), maxit = 200; end
if xl > xu, error('input lower guess first'),end
if xl == xu, error('lower & upper bound can not be the same'), end

% Checks to make sure the guesses bracket a root
a = func(xl);
b = func(xu);
if a*b > 0, error('guesses need to bracket a root'), end

% Checks to make sure the guesses aren't a root
if a == 0 || b == 0
    if a == 0
        xr = xl;
    end
    if b == 0
        xr = xu;
    end
end

iter = 0;

if a*b < 0
   ea = abs((xu - xl)/xu)*100;
    xr = xl;
    while ea > es && iter < maxit
        xr_old = xr;
        xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        iter = iter + 1;
        
        % Estimates the error
        ea = abs((xr - xr_old)/xr)*100;
        
        % Checks to see if the estimated root is actually the root
        fx = func(xr);
        a = func(xl);
        test = fx * a;
        
        if test > 0
           xl = xr;
        elseif test < 0
            xu = xr;
        else
            ea = 0;
        end
    end
end
root = xr;

end

