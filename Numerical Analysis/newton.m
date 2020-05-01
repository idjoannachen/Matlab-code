function [k,iteration] = newton(f,df,eps,k0,max_iteration)

iteration = 0;
k = k0;

while abs(f(k)) > eps && iteration < max_iteration
   iteration = iteration + 1;
   k = k - f(k)/df(k);
end

end
