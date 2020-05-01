function [y, R] = lagrange(X, Y, x, M)  
%x is the X axis of (x_i, y_i)(i=0,1,2,...n), Y the y-aixs; M satisfiees
%|f~(n+1)(x)|<=M, f~(n+1) means the n+1 derivative of f(x), output is y and
%
n = length(X);m = length(x);  
for i = 1:m  
    z = x(i);  
    s = 0.0;  
    for k = 1:n  
        p = 1.0; q1 = 1.0; c1 = 1.0;  
        for j = 1:n  
            if j~=k  
                p = p * (z - X(j)) / (X(k) - X(j));  
            end  
            q1 = abs(q1 * (z - X(j)));  
            c1 = c1 * j;  
        end  
        s = p * Y(k) + s;  
    end  
    y(i) = s;  
    R(i) = M * q1 / c1;  
end  