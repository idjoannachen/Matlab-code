function [diff, x] = gauss_seidel(A,b,n,x0)
%This function performs Gauss-Seidel iteration input :A,b,epsilon,x0 output x:approx. solution
%epfunction [x] = gauss_seidel(A,b,epsilon,x0) silon: tolerance. %xo: the initial vector of iteration
format long

%u''=1, so u'=x+C, u=1/2x^2+Cx+D; 1=1/2+C+D; 1=1/2-C+D; so C+D=1/2,
%d-c=1/2. so d=1/2, c=0; u=1/2x^2+1/2

z=(-1:0.01:1);
% u=1/2*z.^2+1/2;
uz = 1/2 * z.^2 + ones(1, 201) * 1/2;

D=diag(diag(A)); %diagonal matrix of A
E=-tril(A,-1); 
F=-triu(A,1);

P=D-E;
N=F
B=inv(P)*N;
p=inv(P);
x=x0;

for j=1:n    
%    y=x;
    x=B*x+p*b
%     n=n+1;
end

% for i=1:length(u)
% diff=u(i)-[1;x;1];
% %error 
% diff=norm(diff)
% % end

 diff = norm(transpose(uz) - [1;x;1]);

end

