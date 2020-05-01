function h = cconv_hw5(x, y)
%4.12 this function performs one-dimensional circular convolution

m = length(x);
n = length(y);
if(m > n)
    X = fft(x, m);
    Y = fft(y, m);
    H = X .* Y;
else
    X = fft(x, n);  
    Y = fft(y, n);
    H = X .* Y;
end

h = ifft(H);

x = input('input: ')
m = input('m: ')
y1 = mod(x, m)
y2 = x - ceil(x / m) * m + m
h1 = cconv(x, y1)
h2 = cconv(x, y2)