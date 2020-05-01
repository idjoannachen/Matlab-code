function [lambda, xnew] = Power( A, x0, TOL )
%A square matrix whose dominant eigenvalue is to be approximated
%x0 initial vector
%TOL absolute error convergence tolerance
err = TOL+1;

while (err > TOL)
xnew = A * x0;
[m,p] = max(abs(xnew)); %m is the max absolute value of xnew, p is the index
% p = min (find(abs(xnew)  == max(abs(xnew))));
lambda = xnew(p)
x = xnew/xnew(p);
err = max ( abs (x - x0));
mu = 0;
x0 = x
end

% A=[-2 -2 3;-10 1 6;10 -2 -9];
% x0=[1;0;0];
% q=3;
% TOL=0.01;