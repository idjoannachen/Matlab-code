function h = cconv(x, y)
% 4.12 this function performs one-dimensional circular convolution

m = length(x)
n = length(y)
if(m > n)
    X = fft(x, m)
    Y = fft(y, m)
    H = X .* Y
else
    X = fft(x, n)  
    Y = fft(y, n)
    H = X .* Y
end

h = ifft(H)