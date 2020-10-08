%6.33
x=linspace(-1,1)
y=abs(x)

%see how the result polyval gives
p = polyfit(x,y,4) %degree increase, error decrease. decrease utill a certain degree and stop decrease.
x1 = linspace(-1,1);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

%then use the one I derived in the homework(graph matches polyval graph)
approx=-(105/32)*x.^4+(120/32)*x.^2-(3/32)
plot(x,y,'o')
hold on
plot(x,approx)
hold off

%This is still the one I derived in the hw, computed using matlab
syms x
q0=1/sqrt(2);
q1=x/sqrt(2/3);
q2=(1/2)*(3*x^2-1)/sqrt(2/5);
q3=(1/2)*(5*x^3-3*x)/sqrt(2/7);
q4=(1/4)*(35*x^4-30*x^2+3)/sqrt(2/9);
% q=[q0 q1 q2 q3 q4]

f=abs(x);
approx=int(f*q0,-1,1)*q0+int(f*q1,-1,1)*q1+int(f*q2,-1,1)*q2+int(f*q3,-1,1)*q3+int(f*q4,-1,1)*q4
% approx=(45*x^2)/16 - (105*x^4)/32 + (2^(1/2)*5^(1/2)*10^(1/2)*((3*x^2)/2 - 1/2))/16 + 7/32
figure
x=linspace(-1,1)
y=(45*x.^2)/16 - (105*x.^4)/32 + (2^(1/2)*5^(1/2)*10^(1/2)*((3*x.^2)/2 - 1/2))/16 + 7/32
plot(x,y,'o')
hold on
y1=abs(x)
plot(x,y1,'o')
hold off