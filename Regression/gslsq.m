function [x,res]=gslsq(A,b,tol,risk)
% A is an m by n matrix, b is a vector in R^m, tol is used to determine
% numerical rank. Setting tol=1.e-10 gets good resluts, which are much
% better than x=A\b. The function gslsq(A,b,eps) finds the Gram-Scmidt
% solution x in R^n of min|Ax-b|. It is assumed that null(A) is KNOWN to be
% non-zero, so that x=A\b cannot be used.
% Set risk flag to 0 to take a risk and ignore possible permuations in qr;
% set it to any other value to do it right, but 4 times slower.

% Check input consistency
[m,n]=size(A);
if length(b)~=m
    error(['Vector b must be vector in a R^',num2str(m)])
end
if size(b,2)~=1
    b=b';
end
if (tol<=0) || (tol>=1)
    error('tol parameter must be in (0,1)')
end

% Compute GS solution
if risk==0
    [Q,R]=qr(A); e=1:n;
else
[Q,R,e]=qr(A,'vector'); % <-- 96% of all run time
end
rnk=sum(abs(diag(R))>tol); % rank of A
GS=Q(:,1:rnk); % Gram-Schmidt onb of R(A)
GSC=R(1:rnk,1:rnk); % upper triangular martrix of size rank(A)
                    % of Gram-Schmidt coefficients
b1=GS'*b; Pb=GS*b1; %projection of b onto R(A)
xbar=GSC\b1; x0=[xbar;zeros(n-rnk,1)]; % Gram-Schmidt solution
x(e)=x0'; % correctly permuted answer as a row-vector
res=norm(A*x'-Pb); % residual check for GS

