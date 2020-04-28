function [Fder,F,c]=CPDFs(x,Nb,pl)
% returns CDF and PDF of data x, using Nb bins. pl is plotting flag
N=length(x);
xmin=min(x); xmax=max(x);
bin_width=(xmax-xmin)/Nb;
bn=ceil((x-xmin+0.5*bin_width)/bin_width); % decide which bin the data point x(i) goes into
% we want to avoid the situation where xmin will land in bin 0, which does not exist
% Now count how many x(i)s are in each bin
ind=1:Nb; % bin numbers
[B,I]=meshgrid(bn,ind);
s=sum(B==I,2)/N; % "==" is a logical operator, returning true or false. 
                 % "true" converts to number 1 and "false" to 0
f=[0;s]; % there are Nb+1 division points and s is of length Nb
F=cumsum(f); % all partial sums (discrete antiderivative)
f=f/bin_width; % Normalize, so that the area under the graph of f is 1

% use polynomial approximation to F to compute its derivative
% This will be covered in Chapter 6
dg=20; % the degree of the approximating polynomial
c=linspace(xmin,xmax,Nb+1);
cpad=[xmin-(dg:-1:1)*bin_width,c,xmax+bin_width*(1:dg)]; % pad data to eliminate boundary effects
Fpad=[zeros(dg,1);F;ones(dg,1)];
pfit=polyfit(cpad',Fpad,dg); % polynomial approximation of data
der_coeffs=dg:-1:1;
pfit_der=pfit(1:end-1).*der_coeffs; % derivative of pfit
Fder=polyval(pfit_der,c); % use the derivative of the approximating polynomial to compute values of dF/dc

if pl
% plot PDF and CDF

fs=25; % font size
figure %PDF
plot(c,f,'k',c,Fder,'r','linewidth',2)
xlabel('c')
ylabel('f')
title(['PDF of the data using ',num2str(Nb),' bins'])
set(gca,'fontsize',fs)
axis tight

figure %CDF
plot(c,F,'k','linewidth',2)
xlabel('c')
ylabel('F')
title(['CDF of the data using ',num2str(Nb),' bins'])
set(gca,'fontsize',fs)
end
