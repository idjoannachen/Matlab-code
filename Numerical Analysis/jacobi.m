function [diff, x] = jacobi(A,b,n,x0)  %jacobi iteration 
format long

z = [-1:0.01:1];
uz = 1/2 * z.^2 + ones(1, 201) * 1/2;

D = diag(diag(A)); %diagonal matrix of A
E = -tril(A,-1); 
F = -triu(A,1);

P = D;
N = E+F;
B = inv(P) * N;
p = inv(P);
x = x0;

    for j = 1:n   
    	x = B*x+p*b
    	n = n+1;
    end

diff = norm(transpose(uz) - [1;x;1]);

end
