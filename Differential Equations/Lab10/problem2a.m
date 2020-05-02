function zprime = problem2a(~, z)
    zprime = zeros(2, 1);
    zprime(1) = z(1)+3*z(2);
    zprime(2) = 4*z(1)+2*z(2);
end

