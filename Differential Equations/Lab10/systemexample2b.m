function zprime = systemexample2b(~, z)
    zprime = zeros(2, 1);
    zprime(1) = z(2)-sqrt(z(1));
    zprime(2) = -z(1)-2*z(1)*z(2);
end

