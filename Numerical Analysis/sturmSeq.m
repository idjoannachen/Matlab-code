function p = sturmSeq(c,d,lambda)
% Returns Sturm sequence p associated with
% the tridiagonal matrix A = [c\d\c] and lambda. % USAGE: p = sturmSeq(c,d,lambda).
% Note that |A - lambda*I| = p(n).
n = length(d) + 1;
p = ones(n,1);
p(2) = d(1) - lambda;
for i = 2:n-1
    p(i+1) = (d(i) - lambda)*p(i) - (c(i-1)?2 )*p(i-1);
end