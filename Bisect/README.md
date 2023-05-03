This function uses the bisection root finding method to locate the root of a function. It requires a upper and lower guess that bracket the root. This method of root finding will never diverge, but it may not be the fastest method.
input:
func = name of function
  xl, xu = lower and upper guesses
  es = desired relative error (default = 0.0001%)
  maxit = maximum allowable iterations (default = 50)
output:
  root = root estimate
  fx = function value at root estimate
  ea = approximate relative error (%)
  iter = number of iterations
