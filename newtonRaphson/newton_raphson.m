function [root, converged] = newton_raphson(f, df, x0, tol, max_iter)
% Inputs:
% f: the function to find the root of
% df: the derivative of the function f
% x0: the initial guess for the root
% tol: the tolerance level for the convergence
% max_iter: the maximum number of iterations

% Outputs:
% root: the estimated root of the function f
% converged: a boolean value indicating whether the algorithm converged or not

% Set the initial values for the iteration
x = x0;
iter = 0;
converged = false;

% Iterate until convergence or the maximum number of iterations is reached
while iter < max_iter
    fx = f(x);
    dfx = df(x);
    if abs(fx) < tol
        % Convergence is reached
        converged = true;
        root = x;
        return;
    end
    
    % Perform the Newton-Raphson update
    x = x - fx/dfx;
    
    % Increment the iteration count
    iter = iter + 1;
end

% If the code reaches here, the algorithm did not converge
converged = false;
root = NaN;
