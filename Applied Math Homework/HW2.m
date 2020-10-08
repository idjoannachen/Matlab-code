%% Problem 4
%Given n decimal digits of pi - 3 write a Matlab program that returns 
%its binary repsentation. (Note that the output must contain N binary 
%digits, where N is given by (1.3).)

%   tic
digits(10000);
num = vpa(pi)-3;
n = 1000;                       %decimal digit
N = floor(n*log(5)/log(2))+n-1; %binary digit
binary_f = zeros(1,N);          %create a vector to save output binary digits

for i = 1:N
    if (2*num) < 1
        binary_f(i) = 0;
        num = 2*num;
    else
        binary_f(i) = 1;
        num = 2*num-1;
    end
end
binary_f;
%   toc                         %Elapsed time is 467.599993 seconds.

%% Problem 5
%Using the binary expansion of pi obtained in previous HW problem check 
%if the binary digits di of this expansion behave like i.i.d.r.v. with respect to 
%(a) the law of large numbers and (b) CLT. 
% 
% binary representation of pi
    % nint=floor(pi);                   %integer part
    % binary_int=dec2bin(nint);         %dec2bin returns a char array
    % binary_int=double(binary_int)-48; %double() gives ASCII value, subtract 48 to get double array
    % binary=[binary_int binary_f]      %combine integer and binary parts

%(a) plot averages of first k binary digits vs. k for k >= 100 and the line y = 1/2.
k = N;
k_range = 100:k;
delta_k_save = zeros(1,k); 

% for i = 100:k
%     cumsum_binary_vector = cumsum(binary_f(1:i));
%     delta_k_save(i) = cumsum_binary_vector(i)./i;
% end


delta_k=cumsum(binary_f);
delta_k_save=delta_k(100:end)./k_range;

plot(k_range,delta_k_save)

hold on 
x = 1:k;
y=ones(1,max(k_range))*0.5;
plot(x,y)
      
xlabel('k')
ylabel('averages of first k binary digits')
title('averages of first k binary digits vs. k for k >= 100 and the line y = 1/2')
hold off
axis([100,max(k_range),0,1]);

%% (b)CLT

%   1)split the binary expansion into K pieces of length w, create a K * w matrix
w = 40;   %window size(column number); if w=100, then K=1000. In other words, we have 1000 of {c1,?,c100). 
row_number = floor(N/w);
binary_matrix = reshape(binary_f,row_number,w);

%   2)compute (average of each row 100 c's - 1/2)*sqrt(w)/(1/2)= a number,
average_each_row = mean(binary_matrix,2);
average_each_row = (average_each_row-1/2)*2*sqrt(w);

%   3)compute empirical PDF of these K numbers 
[Fder,F,c]=CPDF(average_each_row,80,false);
%Fder gives pdf, F gives cdf. We want to use pdf.
v = -4:0.1:4;
h = histogram(Fder,v,'Normalization','probability')
hold on
phi=exp(-(v.^2)/2)/sqrt(2*pi);
plot(v,phi,'LineWidth',1.5)

xlabel('numbers')
ylabel('PDF')
title('PDF of the data using 80 bins against phi(x)=exp(-x^2/2)/sqrt(2*pi)')
hold off






