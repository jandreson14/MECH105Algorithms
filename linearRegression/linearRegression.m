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

if length(x) == length(y)

    [sortedY, sortOrder] = sort(y)
    sortedX = x(sortOrder)
    x = sortedX
    y = sortedY
    n = length(x)

    q1i = floor((n + 1)/4)
    q3i = floor((n*3 + 3)/4)
    Q1 = y(q1i)
    Q3 = y(q3i)
    IQR = Q3 - Q1
    outlierIndex = (y > Q3 + 1.5*IQR) | (y < Q1 - 1.5*IQR);
    fX = x(~outlierIndex)
    fY = y(~outlierIndex)
    [sortedY, sortOrder] = sort(fY)
    sortedX = x(sortOrder)
    fX = sortedX
    fY = sortedY
    n = length(fX)

    sum_x = sum(fX)
    sum_y = sum(fY)
    sumxsquared = sum(fX.^2)
    xsquared = (sum(fX)).^2
    xy = sum(fX.*fY)
    y_bar = mean(fY)
    x_bar = mean(fX)

    a1 = (n*xy - sum_x*sum_y) / (n*sumxsquared - xsquared)
    a0 = y_bar - a1*x_bar
    slope = a1
    intercept = a0


    st = sum((fY-y_bar).^2)
    sr = sum((fY-a0-(a1*fX)).^2)
    Rsquared = (st-sr)/st


elseif length(x) ~= length(y)
    error('The x and y array inputs must be the same length')
end
end

