This function estimates an integral numerically using the Simpson's composite 1/3 rule. If the given interval contains an odd number of segments, the trapeziodal rule will be used to evaluate the last segment. In addition to this, if the given interval only contains two data points, the trapeziodal rule will be used to evaluate the integral since at least 3 points are needed to use Simpson's 1/3 rule.

Inputs
   x = the vector of equally spaced independent variable
   y = the vector of function values with respect to x
   
Outputs:
   I = the numerical integral calculated
