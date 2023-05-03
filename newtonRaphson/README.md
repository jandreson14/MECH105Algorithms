This algorithm finds the root of a function using the Newton-Raphson root finding method. This method is a open method, meaning it only needs one inital guess at the root. If this inital guess is close to a min, max, or inflection point, the solution will diverge and the function will not locate the root.

Inputs:
* f: the function to find the root of
* df: the derivative of the function f
* x0: the initial guess for the root
* tol: the tolerance level for the convergence
* max_iter: the maximum number of iterations

Outputs:
* root: the estimated root of the function f
* converged: a boolean value indicating whether the algorithm converged or not
