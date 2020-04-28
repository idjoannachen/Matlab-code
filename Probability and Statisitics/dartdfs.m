sigma=[1,2,3,5];
cmult=1;
cmax=cmult*max(sigma);
c=linspace(0,cmax,200);
F1=1-exp(-c.^2/(2*sigma(1)));
F2=1-exp(-c.^2/(2*sigma(2)));
F3=1-exp(-c.^2/(2*sigma(3)));
F4=1-exp(-c.^2/(2*sigma(4)));
figure
plot(c,F1,'y',c,F2,c,F3,'c',c,F4,'g','linewidth',2)
xlabel('c')
ylabel('F')
title('CDF of a dart game. F(x)=exp(-c^2/2\sigma^2)')
lb1=['\sigma=',num2str(sigma(1))];
lb2=['\sigma=',num2str(sigma(2))];
lb3=['\sigma=',num2str(sigma(3))];
lb4=['\sigma=',num2str(sigma(4))];
legend(lb1,lb2,lb3,lb4,'location','east')
set(gca,'fontsize',20)

cmult=2;
cmax=cmult*max(sigma);
c=linspace(0,cmax,200);
f1=c.*exp(-c.^2/(2*sigma(1)))/sigma(1)^2;
f2=c.*exp(-c.^2/(2*sigma(2)))/sigma(2)^2;
f3=c.*exp(-c.^2/(2*sigma(3)))/sigma(3)^2;
f4=c.*exp(-c.^2/(2*sigma(4)))/sigma(4)^2;
figure
plot(c,f1,'k',c,f2,'b',c,f3,'r',c,f4,'g','linewidth',2)
xlabel('c')
ylabel('F')
title('PDF of a dart game. f(x)=c*exp(-c^2/2\sigma^2)/\sigma^2')
lb1=['\sigma=',num2str(sigma(1))];
lb2=['\sigma=',num2str(sigma(2))];
lb3=['\sigma=',num2str(sigma(3))];
lb4=['\sigma=',num2str(sigma(4))];
legend(lb1,lb2,lb3,lb4,'location','east')
set(gca,'fontsize',20)
