function xprime = springmass(~, x, m, b, k)
    xprime = zeros(2, 1);
    xprime(1) = x(2);
    xprime(2) = -1/m*(b*x(2)+k*x(1));
end

