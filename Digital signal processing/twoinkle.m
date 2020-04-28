% Twinkle, twinkle little star (see twinkle.m) with added noise and an
% avergaing filter for noise reduction
 
%% Time domain 

fS=44100;
T=24;
pos=3688;
qn=fS*3/7;
a= 440;
c=261.63;
d=293.66;
e=329.63;
f=349.23;
g=392;
z=0;

h=1/fS;
M=fS*T;
Y=zeros(M,1);
nq=0:qn; nh=0:2*qn;

music=[c c g g a a g z f f e e d d c z g g f f e e d z g g f f e e d z c c g g a a g z f f e e d d c];
L=[1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2];
NN=length(music);
j=0;
for k=1:NN
    if L(k)==1 
       n=nq;
    else
       n=nh;
    end
    y=sin(2*pi*music(k)*n/fS);
    Y(j+1:j+1+qn*L(k))=0.9*y;
    j=j+qn+L(k)*pos;
end

%sound(Y,S) % plays u ndistorted sound
noise=0.05*randn(size(Y));
noisY=Y+noise;
sound(noisY,fS) % plays noisy sound
%wavwrite(Y,fS,'twoinkle.wav')

%% Time domain denoising

% Apply the averaging filter to denoise
%
window=50;
b=ones(1,window)/window;
fY=filter(b,1,noisY);
amp=0.9/max(abs(fY));
fY=fY*amp;
sound(fY,fS) % plays filtered noise reduced sound
%}

%% Kill g game

% Apply the filter to kill the note g (the most frequent note)
%
K=round(fS/(2*g));
notch=zeros(1,K+1);
notch(1)=1; notch(end)=1;
nogY=filter(notch,1,Y);
sound(nogY,fS) % plays the song with g notes suppressed
%}

%% Frequency domain visualizing

Yhat=fft(Y);
nYhat=fft(noisY);
Yhatabs=abs(Yhat);
nYhatabs=abs(nYhat);

%plot(Yhatabs)

%
Nrange=round(length(Y)/2);
% Take a look at the frequency range corresponding to musical notes
figure
plot(Yhatabs(1:16000))
title('Twinkle twinkle little star in frequency domain')

figure
plot(nYhatabs(1:16000))
title('Noisy Twinkle twinkle little star in frequency domain')

%}

%
% Take a look at the frequency range corresponding to noise
figure
plot(Yhatabs(16001:Nrange))
title('Twinkle twinkle little star in frequency domain')

figure
plot(nYhatabs(16001:Nrange))
title('Noisy Twinkle twinkle little star in frequency domain')
%}

%% Spectral denoising

%
% after "eyeballing the noise" we determine clevel=150
clevel=200; % 100-noisy, 150-cleaned, 200-eerie clean
patch=nYhat(16001:end+1-16000).*(nYhatabs(16001:end+1-16000)>clevel);
cleanYhat=[nYhat(1:16000);patch;nYhat(end-16000+2:end)];
cleanY=real(ifft(cleanYhat));
sound(cleanY,fS)
%}

%% Kill g game

%
N=length(Y);
kill_index=round(g*length(Y)/fS);
kill_window=100;
Yhat(kill_index-kill_window:kill_index+kill_window)=0;
Yhat(N+2-kill_index-kill_window:N+2-kill_index+kill_window)=0;
Ynog=real(ifft(Yhat));
sound(Ynog,fS);
%}