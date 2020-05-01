function s=simpson(f,a,b,n,x,x1) 
%n is the number of subinterval

n=input('please input "n"=');
a=input('please input "a"=');
b=input('please input "b"=');
%s is the total area of trapeziudal
h=((b-a)/n);

s=0; 
t=0; 
for k = 1:n-1 
    x = a + k*h;  
    s = s + feval('f',x); 
end

for k = 1:n-1     
    c = a + (1/2+k)*h;     
    d = numel(c)-1;     
    t = t + feval('f',d); 
end

s = h/3 * (feval('f',a) + feval('f',b) + 2*s + 4*t);