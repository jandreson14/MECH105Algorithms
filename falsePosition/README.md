The false postion function is a root finding function that uses the false postion method to evaluate the root of a function. This method is a closed method meaning the two inital guesses must bracket the root in order for in to converge. After each iteration, the function splits the interval in half and then checks for a sign change to replace the upper or lower bracket to converge on the root.

Inputs:
   func - the function being evaluated
   xl - the lower guess
   xu - the upper guess  
   es - the desired relative error (optional input defaults to 0.0001% if not specified)
   maxit - the maximum number of iterations to use (optional input defaults to 200 if not specified)

Outputs:
   root - the estimated root location
   
   fx - the function evaluated at the root location
   
   ea - the approximate relative error (%)
   
   iter - how many iterations were performed
