function [ p,s ] = givens_method( T,lambda )
%   Find polynomial vector Pi(lambda) to find eigenvalue 
%   T = tridiagonal matrix
%   lambda = guess eigenvalue (used in bisection method)
%   p = a pvector polynomials (pi_1 to pi_n)
%   s = the number of sign change

n = size(T,1); %determine the size of matrix T
p = zeros(n,1); %initialize the polynomial
s = 0; %initialize the number of sign

p(1) = -lambda + T(1,1); % initialize from p(0) = 1

if p(1) < 0, s = 1; end
p(2) = (-lambda + T(2,2))*p(1) - abs(T(1,2))^2;

if p(2)*p(1) < 0, s = s+1; end

%formula for Pi(lambda)
for k = 3:n   
% % %     
    p(k) = (-lambda + T(k,k))*p(k-1) - abs(T(k-1,k))^2*p(k-2);
    if p(k)*p(k-1) < 0, s = s+1; end
end
s=n-s;