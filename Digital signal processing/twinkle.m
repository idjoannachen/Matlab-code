function twinkle(N)
% Twinkle, twinkle little star
% N=0,1,2 or 3 selects a different waveform to use to make notes
% The ordinary tempo (andante) is 140 quarter notes per minute. 
% That means that each quarter note is 60/140=3/7 seconds. 
% The standard PCM (Pulse-code modulation) format samples the sound 
% 44100 times per second, or at 44.1KHz sampling rate.
% This gives us exactly 3*44100/7=18900 samples per quarter note.
% Twinkle, twinkle song has 36 quarter notes, 6 half-notes and 5 quarter note pauses.
% This gives 36+2*6+5=53 quarter notes, or 53*3/7=22.7 seconds
% However, we also need to insert small pauses between notes, 
% since twinkle twinkle song is not played legato. There are 41 spaces between 
% 36+6=42 non-silent notes. Total duration of music, as played on the piano
% is 24 seconds, so we want to make each space 44100*24/(7*41)=3688 samples

fS=44100; % sampling frequency
T=24; % music duration
pos=3688; % duration of the pause (denoted by z)
qn=fS*3/7; % quarter note duration is 3/7 seconds
% note frequencies
a= 440;
c=261.63;
d=293.66;
e=329.63;
f=349.23;
g=392;
z=0;

M=fS*T; % total number of samples in the entire music
Y=zeros(M,1);
nq=0:qn; nh=0:2*qn; % quarter note and half-note

music=[c c g g a a g z f f e e d d c z g g f f e e d z g g f f e e d z c c g g a a g z f f e e d d c];
L=    [1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 2];
NN=length(music);
j=0;
for k=1:NN
    if L(k)==1 
       n=nq;
    else
       n=nh;
    end
% show waveform
    t=linspace(0,2*pi);
    yt=waveform(t,N);
    plot(t,yt,[t(1),t(end)],[0,0],'k')
    y=waveform(2*pi*music(k)*n/fS,N); % make note k
    Y(j+1:j+1+qn*L(k))=0.9*y; % place it into the music timeline
    j=j+qn+L(k)*pos; % reset current timeline location
end
sound(Y,fS) % play music
disp('Press a key after the music')
pause

%wavwrite(Y,fS,'twinkle.wav') % record the music
% make frequency domain representation of the music
Yhat=fft(Y);
Yhatr=real(Yhat);
Yhati=imag(Yhat);
figure
%{
plot(Yhatr(1:16000))
title('real part')
figure
plot(Yhati(1:16000))
title('imaginary part')
%}
Yhatabs=abs(Yhat);
fmax=500; % maximal frequency to display
kmax=round(T*fmax); % sample correponding to maximal frequency to display
plot((1:kmax)/T,Yhatabs(1:kmax)/fS)
xlabel('frequency, Hz')
title('Twinkle twinkle little star in frequency domain')
set(gca,'fontsize',24)
end

function y=waveform(x,n)
% must be a 2*pi-periodic function with y(0)=0
if n==0 % pure sine
    y=sin(x);
end
if n==1 % triangle
    xx=mod(x,2*pi);
    y=-abs(xx-pi)+pi;
end
if n==2
    y=-0.1*sin(x)+0.3*sin(2*x)-0.5*sin(3*x); % 3 overtones
end
if n==3
  y=(sin(x)+0.7*sin(2*x)-0.33*sin(3*x))/1.6; % same 3 overtones with different amplitudes
end
end
