function [lambda,v] = InversePower(A,x0,q,TOL)

[n n] = size(A);
A = A - q*eye(n);               % Form the matrix A - q*I
B=inv(A);

[lambda1,x]= Power(B, x0, TOL)

lambda = 1/lambda1 + q %eigenvalue
v=x %eigenvector