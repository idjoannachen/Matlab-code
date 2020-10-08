function a = poly_regression_hw6(m,x,y) 
n=length(x);
phi=zeros(m,n);
for i=2:m
    phi(i,:)=x.^(i);
end

A=phi*phi';
b=phi*y';
a=A\b;