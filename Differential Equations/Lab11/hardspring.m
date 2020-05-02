function xprime = hardspring(~, x)
    xprime = zeros(2, 1);
    xprime(1) = x(2);
    xprime(2) = -(3*x(2)+x(1)+x(1)^3);
end

