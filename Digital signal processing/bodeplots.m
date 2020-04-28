function bodeplots(H,fS,polar)

% bodeplots(H,fS,polar)
% H is the handle for H(z), fS is the sampling frequency in Hz
% and polar is logical. If polar is true then polar plot is displayed.
%
% Example: bodeplots(@(z) 0.5*(z+1)./z,1000,0)
% Alternatively, a separate function file 
% (e.g. Hfun.m) for H(z) can be referenced. For example:
% bodeplots(@Hfun,1000,1)
% 
N=1000; f=linspace(0,fS/2,N); % frequency range
omega=2*pi*f; % circular frequency
T=1/fS; % sampling period
z=exp(1i*omega*T);
Hval=H(z);
r=abs(Hval); % Gain
phi=angle(Hval); %Phase

figure
S=30; % font size
subplot(1,2,1)
plot(f,20*log10(r),'r','linewidth',2)
xlabel('Hz')
ylabel('dB')
title('Gain')
set(gca,'fontsize',S)
axis tight;
subplot(1,2,2)
plot(f,phi,'k','linewidth',2)
xlabel('Hz')
ylabel('radians')
title('Phase shift')
set(gca,'fontsize',S)
axis tight;

figure
subplot(1,2,1)
plot(f,r,'r','linewidth',2)
xlabel('Hz')
ylabel('Gain')
title('Gain')
set(gca,'fontsize',S)
axis tight;
subplot(1,2,2)
plot(f,phi,'k','linewidth',2)
xlabel('Hz')
ylabel('radians')
title('Phase shift')
set(gca,'fontsize',S)
axis tight;

% polar plot
if polar
figure
polarplot(phi,r,'b','linewidth',2)
end