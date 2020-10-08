%% 6.3 Find m and b that minimize abs error
x=[1 1.7 2.3 3.1];
y=[0.6 1.4 3.2 5.2];
point=transpose([x;y]); %each line represents a point (x,y)

%Take two number x,y (a point) as a unit. Choose two from four points. Get all the combination.
sub_x=nchoosek(point(:,1),2);
sub_y=nchoosek(point(:,2),2);
%each row in sub_x (x1,x2) corresponding to each row in sub_y (y1,y2)

%Polyfit each two points
%each value in the first column of coeff represents m, the the second
%column is the corresponding b
coeff=zeros(length(sub_x),2)
for i=1:length(sub_x)
    coeff(i,:)=polyfit(sub_x(i,:),sub_y(i,:),1)
end

%Compute the abs error in norm 1
%(sum of absolute values, not an abs value of sum!)
for j=1:length(coeff)
    distance=sum(abs(y-coeff(j,1).*x - coeff(j,2)))
    if distance<=min_distance
        min_distance=distance
end

%Get the index of minimum distance and find corresponding coefficient
[value idx]=min(abs(distance))
coeff=coeff(idx,:)

%% 6.4 Solve c and k for y=ce^(kx)
x = linspace(-3,4);
y = 3*exp(-2*x)+randn(size(x));
f = @(k) sum(x.*y.*exp(k*x))*sum(exp(2*k*x))- sum(y.*exp(k*x))* sum(x.*exp(2*k*x));
df= @(k) sum(x.*y.*x.*exp(k*x))*sum(exp(2*k*x)) + sum(x.*y.*exp(k*x))*sum(2*x.*exp(2*k*x)) - sum(y.*x.*exp(k*x))*sum(x.*exp(2*k*x)) - sum(y.*exp(k*x))* sum(x*2.*x.*exp(2*k*x));
%find k using newtons method
eps = 10^(-10);
x0 = 0;
max_iteration=10000;
[k,iteration] = applmath_hw6_newton(f,df,eps,x0,max_iteration)
c=sum(y.*exp(k*x))/sum(exp(2*k*x))

%% 6.5 Linear regression
% x = input('input vector x: ')
% y = input('input vector y: ')
%Data generation
x=linspace(-3,4)
y=5*x-17
plot(x,y,'r')
hold on
NL=10; %if NL=0, then y=y
y=y+NL*randn(size(x)) %NL:noise level

%f(x)=ax+b
n=length(x);
a=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum((x).^2)-(sum(x).^2))
b=(sum(x)*sum(y.*x)-sum((x).^2)*sum(y))/((sum(x)).^2-n*(sum(x.^2)))
plot(x,a*x+b,'b')
hold off

%% 6.6 Find the best-fitting quadratic y=ax^2+bx+c to the data
x=[-2 -1 1 2 3];
y=[2 1 -1 0 2];
%Fit a polynomial of degree 2 to the 5 points.
poly=polyfit(x,y,2)

scatter(x,y,'k'); 
xlabel('x');  
ylabel('y');  
hold on
x_11=[-2:1:5];
plot(x_11,poly(1)*x_11.^2+poly(2).*x_11+poly(3),'r')
title('quadratic regression'); 

%% 6.9
%Write a routine for best fitting a polynomial of degree m to data points
%(xj,yj) for j=1,2,3,...,n, where n>m and where the xj are distinct.
%Compare your result against polyfit
x = linspace(-3,4);
y = 3*exp(-2*x)+randn(size(x));

%Fit a polynomial of degree 2 to the 5 points.
coef = transpose(poly_regression_hw6(2,x,y))
poly=polyfit(x,y,2)
