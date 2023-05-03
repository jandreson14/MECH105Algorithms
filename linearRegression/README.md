This linear regression function calculates the linear regression slope and intercept of a data set using the normal equations. The data set is first filtered of any outliers, then the regression analysis performed. The R^2 value of the regression is also displayed as an output.

Inputs:
* x: x-values for our data set
* y: y-values for our data set

Outputs:
* fX: x-values with outliers removed
* fY: y-values with outliers removed
* slope: slope from the linear regression y=mx+b
* intercept: intercept from the linear regression y=mx+b
* Rsquared: R^2, a.k.a. coefficient of determination
