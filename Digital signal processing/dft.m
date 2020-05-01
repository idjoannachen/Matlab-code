function X = dft(x)

N = length(x);
w = exp(-i*2*pi/N);
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
W = w.^nk;
X = x*W;

end