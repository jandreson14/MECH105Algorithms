function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method
% Inputs:
%   func - the function being evaluated
%   xl - the lower guess
%   xu - the upper guess
%   es - the desired relative error (should default to 0.0001%)
%   maxit - the maximum number of iterations to use (should default to 200)

% Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

% Check number of input arguments
if nargin < 3
    error('At least 3 input arguments are required');
end
if nargin < 4
    es = 0.000001;
end
if nargin < 5
    maxit = 200;
end

% Check to see if root is between upper and lower brackets
if func(xl) * func(xu) > 0
    error('Function has no sign change between brackets');
end

ea = 100;
iter = 0;
xr = xu

while ea > es && iter < maxit
    xrold = xr
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu))
    ea = abs((xr - xrold)/xr)*100
    iter = iter + 1
    if func(xr)*func(xu) > 0 
        xu = xr
    elseif func(xr)*func(xu) < 0
        xl = xr
    else %func(xr) = 0
        ea = 0
    end
end

fx = func(xr);
root = xr;
ea = abs(ea)*100;


end


