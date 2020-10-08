%% 4.19
fS = 1000;
T = 1/ fS;
L = 1500;
t = (0:L-1) * T;
x = [0.7*sin(2*pi*50*t), sin(2*pi*120*t)];
N = 2;
% tic
fft(x, N)
% fftTime = toc
% tic
dft(x,N)
% fdtTime = toc

%% 4.9
% Rivise Routine 4.1 to handle a sampling rate of fs=20 kHz and fram length
% n=8192. Display the spectrum between 400 and 500 Hz.
fS = 20000;
t = 0:fS-1;
t = t/fS;
w = 2 * pi * 440;
x = sin(w * t);
x = x + .2*sin(2*w*t);
x = x + .1*sin(3.01*w*t);
x = x + .4*randn(1, fS);
n = 8192;
m = 400;
M = 500;
xhat = fft(x,n);
xhat = xhat/n;
f = 0:n-1;
f = f(m:M);
yhat = xhat(m:M);
plot(f,abs(yhat))

%% 4.12
x = input('input: ')
m = input('m: ')
y1 = mod(x, m)
y2 = x - ceil(x / m) * m + m
h1 = cconv(x, y1)
h2 = cconv(x, y2)

%% 4.19
fS = 1000;
T = 1/ fS;
L = 1500;
t = (0:L-1) * T;
x = [0.7*sin(2*pi*50*t), sin(2*pi*120*t)];
N = 2;
% tic
fft(x, N)
% fftTime = toc
% tic
dft(x)
% fdtTime = toc