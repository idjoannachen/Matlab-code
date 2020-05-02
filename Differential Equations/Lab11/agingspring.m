function xprime = agingspring(t, x)
    xprime = zeros(2, 1);
    xprime(1) = x(2);
    xprime(2) = -2*exp(-0.12*t)*x(1);
end

