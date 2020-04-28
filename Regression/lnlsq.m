function [x,res]=lnlsq(A,b,tol,risk)
% A is an m by n matrix, b is a vector in R^m
% lnlsq finds the least norm solution x in R^n of min|Ax-b|.
% It is assumed that null(A) is KNOWN to be non-zero, 
% so that x=A\b cannot be used. 
% x=lnlsq(A,b,eps,risk) is equialent to x=pinv(A)*b. Setting tol=1.e-10
% beats pinv both in speed and accuracy.
% Set risk flag to 0 to take a risk and ignore possible permuations in qr;
% set it to any other value to do it right, but 4 times slower.
% This gives 2x speed up compared to x=pinv(A)*b if risk is not 0 
% and 8x speedup if risk=0. The program was tested on random 3000x3000
% matrices A of rank 100.

% Check input consistency
[m,n]=size(A);
if length(b)~=m
    error(['Vector b must be vector in R^',num2str(m)])
end
if size(b,2)~=1
    b=b';
end
if (tol<=0) || (tol>=1)
    error('tol parameter must be in (0,1)')
end

% Compute least norm least squares solution of Ax=b
if risk==0
    [Q,R]=qr(A); e=1:n;
else
[Q,R,e]=qr(A,'vector'); % <-- 96% of all run time
end
rnk=sum(abs(diag(R))>tol); % rank of A
GS=Q(:,1:rnk); % Gram-Schmidt onb of R(A), Q=[GS *]
GSC=R(1:rnk,1:rnk); % upper triangular martrix of size rank(A)
                    % of Gram-Schmidt coefficients
J=R(1:rnk,(rnk+1):n); %     [ GSC J ]
                      % R = [       ]
                      %     [ 0   0 ]
b1=GS'*b; Pb=GS*b1; %projection of b onto R(A)
xbar=GSC\b1; % Gram-Schmidt solution is [xbar;0]

% Null(A)=<-inv(GSC)*J*z,z>
% compute z such that x=<xbar-inv(GSC)*J*z,z> is in Null(A)^perp.
RinvJ=GSC\J;
c=RinvJ'*xbar;
M=eye(n-rnk)+RinvJ'*RinvJ;
z=M\c;

% Compute least norm solution x
x0=[xbar-RinvJ*z;z];
x(e)=x0'; % correctly permuted answer
res=norm(A*x'-Pb); % residual check for GS