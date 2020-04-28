function elcsim(V,r0,R1,R2,n,nl)
% This function simulates noisy measurement data for a simple electric
% circuit and uses two least squares methods to find parameters of the
% battery: nominal voltage and internal resistance. In the list of input
% parameters V is the true nominal voltage, r0 true value of the internal
% resistance. n measurements of voltage drop accross the load are made at
% uniformly distributed values of the load in the interval [R1,R2]. The
% noise level nl is the percentage of the smallest value of U.

% For simulation we choose V=2,r0=5,R1=10,R2=50,n=20,nl=1% 
x=linspace(0,R2); % exact law for graphical comparison
y=V*x./(x+r0);

R=sort(R1+(R2-R1)*rand(1,n)); % ordered vector of n resistances at which voltage measurements are made
U=V*R./(R+r0); % exact voltages
Unl=nl*U(1)/100; % noise level of U
Un=U+Unl*randn(size(U)); % noisy data

figure % graphical representation of the noisy data 
plot(R,Un,'*',x,y,'k'); 
axis([R1 R2 U(1) U(end)])
xlabel('R'); 
ylabel('U')
title('Physical law U=U(R) and noisy data')

% linear least squares fit between 1/U and 1/R
% 1/U = (r0/V)*1/R + 1/V
X=1./R; Y=1./Un;
kb=polyfit(X,Y,1); % kb(1)=r0/V, kb(2)=1/V
Vlin=1/kb(2);
r0lin=kb(1)*Vlin;
Ulin=Vlin*x./(x+r0lin); % for graphical comparision

% nonlinear least squares

% first we graph the function whose zero(s) we want to compute
equation=zeros(1,length(x)); % preallocate memory space for faster code
for i=1:length(x)
equation(i)=elc(R,Un,x(i)); % elc(R,U,r0)=0 is the equation for r0 after elimination of V
end
figure
plot(x,equation,x,zeros(size(x))); 
xlabel('r_0')
ylabel('equation')
title('Graph of equation(r_0) to see how many zeros it has')

% there is a unique root
eq=@(r0) elc(R,Un,r0);
r0nl=fzero(eq,0.5*(R1+R2));
numV=sum(R.*Un./(R+r0nl));
denV=sum(R.^2./(R+r0nl).^2);
Vnl=numV/denV;
Unl=Vnl*x./(x+r0nl); % for graphical comparision

% graph the true law and the two least squares estimates
figure
plot(x,y,'k',x,Ulin,'r',x,Unl,'b')
legend('true law','linear least squares','nonlinear least squares','location','southeast')
xlabel('R')
ylabel('U')
%title('Comparison of two least squares methods') 
% By default Matlab's graphs are not suitable for inclusion in a report or
% a paper because the default font is too small. We need to make it much
% larger:
set(gca,'fontsize',24) % font size in points.
% We will also use caption under the graph in a report instead of Matlab's
% title. Finally, we need to save the graph in a file in a desired format 
% for inclusion in a report.
print(gcf,'-depsc','Vrfit.eps') % saves currently active figure (i.e. the 
% last figure the code has produced) in eps format with color in a file named Vrfit.eps
% To save in pdf format use pdf instead of epsc and also change the file extension. 
% from .eps to .pdf. To save in jpeg format use jpeg instead of epsc. 
% There are many other formats. See Matlab documentation for print. 
end

% You can include any number of "helper functions" after the main function
% in order to keep your project code in as few files as possible
function eq=elc(R,U,r0)
numV=sum(R.*U./(R+r0));
denV=sum(R.^2./(R+r0).^2);
V=numV/denV;
cV=sum(R.^2./(R+r0).^3);
c0=sum(R.*U./(R+r0).^2);
eq=V*cV-c0;
end
