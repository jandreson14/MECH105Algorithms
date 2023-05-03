This function uses the LU Decompostion matrix solving method. With an input of a 2x2 or 3x3 square matrix, pivoting is first performed. Then gauss elimination is performed to create the lower triangular matrix. The pivots are tracked in the pivot or permutation matrix and the upper triangular matrix tracks the scalars used in the eliminations of rows.

Inputs:
* A = coefficient matrix

Outputs:
* L = lower triangular matrix
* U = upper triangular matrix
* P = the permutation matrix
