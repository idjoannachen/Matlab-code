function zprime = systemexample2a(~, z)
    zprime = zeros(2, 1); %creates zprime as a column vector
    zprime(1) = z(2);
    zprime(2) = z(1);
end

