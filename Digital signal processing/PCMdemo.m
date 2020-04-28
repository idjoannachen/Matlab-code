echo on
Am=0.5; S=44100; dur=1; t=0:1/S:dur; 
% set amplitude, sampling rate
% and sound duration
pause

% Example
y1=Am*sin(2*pi*440*t); 
% digital data corresponding 
% to middle A note sounding for 1 second. 
%Hit enter to play
pause
sound(y1,S) 

pause
y2=Am*sin(2*pi*880*t); 
% digital data corresponding 
% to A note one octave higher sounding for 1 second.
%Hit enter to play
pause
sound(y2,S)

pause
yy=[y1,y2];  % will play the two notes together legato
pause
sound(yy,S)

pause
yy=[y1,zeros(1,4000),y2]; 
% insert a small pause between the two 
% notes to play then staccato
pause
sound(yy,S)

pause

%% Load notes

load notes 
% will load frequencies of 12 notes in the middle octave. 
% It also loads z=0 and vector stc of 4000 zeros to add after a quarter
% note if it is played staccato. We can now make music.

dur=3/7; % duration of a quarter note in the andante tempo
t=0:1/S:dur; 
A=[Am*sin(2*pi*a*t),stc];
C=[Am*sin(2*pi*c*t),stc];
G=[Am*sin(2*pi*g*t),stc];
music=[C,C,G,G,A,A,G]; % Hit enter to play
pause
sound(music,S)
%}


