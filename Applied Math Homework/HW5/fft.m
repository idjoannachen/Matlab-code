function [ret_val] = fft(vector)
%ret_val returns the dft
%N is the number of point

vector_size = size(vector);
N = vector_size(2); %column number
c = zeros(1,N);

j1 = 0;
for i = 1 : N
    if i < j1 + 1
        %exchange the value of vector(i) and vector(j1+1)
        tmp = vector(j1 + 1);
        vector(j1 + 1) = vector(i);
        vector(i) = tmp;
    end
    while k <= j1  
        j1 = j1 - k;  
        k = k / 2;  
    end  
    j1 = j1 + k;  
end  
     
% Butterfly matrix 
% Compute N 
dig = 0;  
k = N;  
while k > 1  
    dig = dig + 1;  
    k = k / 2;  
end
%m is level, dist the distance of the two points of the butterfly

n = N / 2;  
for m = 1 : dig  
    dist = 2 ^ (m - 1);  
    idx = 1;  
    for i = 1 : n
        idx1 = idx;  
        for j1 = 1 : N / (2 * n)  
            r = (idx - 1) * 2 ^ (dig - m);  
            coef = exp(j * (-2 * pi * r / N));
            tmp                 = vector(idx);
            vector(idx)         = tmp + vector(idx + dist) * coef;
            vector(idx + dist)  = tmp - vector(idx + dist) * coef;idx = idx + 1;  
        end
        idx = idx1 + 2 * dist;
    end
    n = n / 2;
end

ret_val = vector;  
end
