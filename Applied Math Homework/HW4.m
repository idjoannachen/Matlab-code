%% 3.19
% 3.45
H = @(z) (1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-1.8*z.^(-1).*cos(2*pi/12)+0.81*z.^(-2)) %one filter
bodeplots(H,720,0)
H2 = @(z) ((1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-1.8*z.^(-1).*cos(2*pi/12)+0.81*z.^(-2)).^2) %two identical filters
bodeplots(H2,720,0)
%Both H and H2 notch out at 60 Hz(needle locate at the same place). f get amplify around 60 Hz. H2 is over 6
%times larger than H

%% 3.28
% 3.45
H1 = @(z) (1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-1.8*z.^(-1).*cos(2*pi/12)+0.81*z.^(-2))
H2 = @(z) (1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-(0.99 + 0.99)*z.^(-1).*cos(2*pi/12)+(0.99 * 0.99)*z.^(-2))
H3 = @(z) (1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-(0.999 + 0.999)*z.^(-1).*cos(2*pi/12)+(0.999 * 0.999)*z.^(-2))
bodeplots(H1,60,0)
bodeplots(H2,60,0)
bodeplots(H3,60,0)

np = 10; %periods number
period_of_sine = 2*pi;
np_periods = period_of_sine*np;
M = 2*pi*np/(pi/6)
k = 0:M; 
xk = sin(pi*k/6);
numerator = [1 -2 * cos(pi / 6) 1]
d1 = [0.81 -1.8 * cos(pi / 6) 1]
d2 = [0.99 * 0.99 -(0.99 + 0.99)*cos(pi/6) 1]
d3 = [0.999 * 0.999 -(0.999 + 0.999)*cos(pi/6) 1]

y1 = filter(numerator, d1, xk)
figure
semilogy(k,abs(y1))
y2 = filter(numerator, d2, xk)
figure
semilogy(k,abs(y2))
y3 = filter(numerator, d3, xk)
figure
semilogy(k,abs(y3))
