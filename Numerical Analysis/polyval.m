function [plamb,signp]=polyval(a,b,lambda) 
n = length(a);
%a = (a1,...,an)^T and b = (b1,...,bn?1)^T
p(0) = 1;
p(1) = a(1)-lambda;
signp = signdiff(p(0),p(1));

for k=2:n
    p(k-2) = p(k-1);
    p(k-1) = p(k);
    p(k) = (a(k,k)-lambda)*p(k-1) - abs(b(k))^2*p(k-2);
	if signdiff(p(k-1),p(k))
		signp = signp + 1; 
	end
end
plamb=pn; 
end