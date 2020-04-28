% Tractrix: The duck and the drake problem in Ch. 9.
% Comparisons between different schemes for solving systems of ODEs
% described in Ch 12.1 and 12.4.

% Set parameters
vc=1; % current speed
vd=1.5; % drake's speed with respect to water
R0=10; % initial distance between duck and drake
theta0=3*pi/4; % initial angular position of drake wrt duck
N=1000; % number of steps

% ODE
% r'=-vc*cos(theta)-vd=fr(theta);
% theta'=vc*sin(theta)/r=fth(r,theta);

h=(pi-theta0)/N; % step size
fr=@(th) -vc*cos(th)-vd;
fth=@(r,th) vc*sin(th)./r;

% Exact solution (see Lecture notes)
C0=0.5*R0*sin(theta0)*(tan(theta0/2))^(vd/vc);
theta=linspace(theta0,pi,N+1);
rex=@(th) C0*((cos(th/2)).^(vd/vc-1))./((sin(th/2)).^(vd/vc+1));
r=rex(theta);

% Euler
rE=zeros(1,N+1);
thetaE=zeros(1,N+1); 
t=zeros(1,N+1);
rE(1)=R0; thetaE(1)=theta0; 
for i=1:N
    t(i+1)=t(i)+h;
    rE(i+1)=rE(i)+h*fr(thetaE(i));
    thetaE(i+1)=thetaE(i)+h*fth(rE(i),thetaE(i));
end
errE=rE-rex(thetaE);

% Heun
rH=zeros(1,N+1);
thetaH=zeros(1,N+1); 
rH(1)=R0; thetaH(1)=theta0; 
for i=1:N
    m1r=fr(thetaH(i));
    m1t=fth(rH(i),thetaH(i));
    m2r=fr(thetaH(i)+h*m1t);
    m2t=fth(rH(i)+h*m1r,thetaH(i)+h*m1t);
    rH(i+1)=rH(i)+h*(m1r+m2r)/2;
    thetaH(i+1)=thetaH(i)+h*(m1t+m2t)/2;
end
errH=rH-rex(thetaH);

% Second order Euler
rEE=zeros(1,N+1);
thetaEE=zeros(1,N+1); 
rEE(1)=R0; thetaEE(1)=theta0; 
rEE(2)=rH(2); thetaEE(2)=thetaH(2);
for i=1:N-1
    rEE(i+2)=rEE(i)+2*h*fr(thetaEE(i+1));
    thetaEE(i+2)=thetaEE(i)+2*h*fth(rEE(i+1),thetaEE(i+1));
end
errEE=rEE-rex(thetaEE);

% Runge-Kutta
rRK=zeros(1,N+1);
thetaRK=zeros(1,N+1); 
rRK(1)=R0; thetaRK(1)=theta0; 
for i=1:N
    m1r=fr(thetaRK(i));
    m1t=fth(rRK(i),thetaRK(i));
    m2r=fr(thetaRK(i)+h*m1t/2);
    m2t=fth(rRK(i)+h*m1r/2,thetaRK(i)+h*m1t/2);
    m3r=fr(thetaRK(i)+h*m2t/2);
    m3t=fth(rRK(i)+h*m2r/2,thetaRK(i)+h*m2t/2);
    m4r=fr(thetaRK(i)+h*m3t);
    m4t=fth(rRK(i)+h*m3r,thetaRK(i)+h*m3t);
    rRK(i+1)=rRK(i)+h*(m1r+2*m2r+2*m3r+m4r)/6;
    thetaRK(i+1)=thetaRK(i)+h*(m1t+2*m2t+2*m3t+m4t)/6;
end
errRK=rRK-rex(thetaRK);

figure
polarplot(theta,r,'r',thetaE,rE,'y',thetaEE,rEE,'g',thetaH,rH,'b',thetaRK,rRK,'k')
legend('Exact','Euler','2nd order Euler','Heun','Runge-Kutta')
set(gca,'fontsize',24)

figure
semilogy(thetaE,abs(errE),'g',thetaEE,abs(errEE),'b',thetaH,abs(errH),'r',thetaRK,abs(errRK),'k')
legend('Euler','2nd order Euler','Heun','Runge-Kutta')
set(gca,'fontsize',24)