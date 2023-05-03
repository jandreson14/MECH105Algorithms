function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,n] = size(A);
if m~=n
    error('The Matrix is Not Square')
end

P = eye(m);
A1 = A(1,:);
P1 = P(1,:);
L = eye(m)

if m == 2
    if abs(A(1,1))<abs(A(2,1))
        A(1,:) = A(2,:)
        A(2,:) = A1
        P(1,:) = P(2,:)
        P(2,:) = P1
    end
    a21 = A(2,1);
    a11 = A(1,1);
    f = a21/a11;
    L(2,1) = f;
    R1 = f*A(1,:);
    R2 = A(2,:);
    A(2,:) = R2-R1;
    P = P
    L = L
    U = A
end

if m==3

    a11 = A(1,1);
    a21 = A(2,1);
    a31 = A(3,1);
    A1 = A(1,:);
    P = eye(m);
    P1 = P(1,:);
    L = eye(m);

    if abs(a21) > abs(a11) & abs(a31) < abs(a21) % a21 is the largest element
        A(1,:) = A(2,:);
        A(2,:) = A1;
        P(1,:) = P(2,:);
        P(2,:) = P1;
    elseif abs(a31) > abs(a11) & abs(a31) > abs(a21) % a31 is the largest element
        A(1,:) = A(3,:);
        A(3,:) = A1;
        P(1,:) = P(3,:);
        P(3,:) = P1;
    else % a11 has the largest element
        A=A;
    end

    % Perform first gauss elimination
    a21 = A(2,1);
    a11 = A(1,1);
    f = a21/a11;
    L(2,1) = f;
    R1 = f*A(1,:);
    R2 = A(2,:);
    A(2,:) = R2-R1;

    a31 = A(3,1);
    f = a31/a11;
    L(3,1) = f;
    R1 = f*A(1,:);
    R3 = A(3,:);
    A(3,:) = R3-R1;

    a22 = A(2,2);
    a32 = A(3,2);
    A2 = A(2,:);
    P2 = P(2,:);

    if abs(a32) > abs(a22)
        A(2,:) = A(3,:);
        A(3,:) = A2;
        P(2,:) = P(3,:);
        P(3,:) = P2;
    end

    a32 = A(3,2);
    a22 = A(2,2);
    f = a32/a22;
    L(3,2) = f;
    R2 = f*A(2,:);
    R3 = A(3,:);
    A(3,:) = R3-R2;
    U = A;
end

end