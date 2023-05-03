function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

if length(x) ~= length(y)
    error('The inputs are not the same length')
end

n = length(x);
m = x(1):(x(2)-x(1)):x(n);
h = x(n)-x(n-1);

if m ~= x
    error('The x input is not equally spaced')
end

if length(x) == 2 % Only two data points, use single app trap rule
    warning(['This interval contains only two data points so the' ...
        'trapeziodal rule will be used'])
    I_trap = h*(y(1)+y(2))/2;
    I = I_trap;

elseif length(x) == 3 % single app of simpson's 1/3 rule
    I = (y(1)+(4*y(2))+y(3))*h/3;

elseif rem(n-1,2) == 0 % even number of intervals use multiple app simpsons 1/3
    odds = y(2:2:n-2);
    evens = y(3:2:n-1);
    I = (y(1)+(4*sum(odds))+(2*sum(evens))+y(n))*(h/3);

else rem(n-1,2) ~= 0 % odd number of intervals. Use Trap rule for last interval
    warning(['This interval contains an odd number of functions so the' ...
        'trapeziodal rule will be used on the last interval'])
    I_trap = h*(y(n)+y(n-1))/2;
    evens = y(3:2:n-3);
    odds = y(2:2:n-2);
    I = (y(1) + 2*sum(evens) + 4*sum(odds) + y(n)) * h/3;
    I = I+I_trap;

end

end