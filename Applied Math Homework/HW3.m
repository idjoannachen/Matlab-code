% Construct the polar plots of the notch filters 3.36 and 3.45
% 3.36
bodeplots(@(z) 1+z.^(-6),720,1)
% 3.45
H = @(z) (1-2.*z.^(-1).*cos(2*pi/12)+z.^(-2))./(1-1.8*z.^(-1).*cos(2*pi/12)+0.81*z.^(-2))
bodeplots(H,720,1)
