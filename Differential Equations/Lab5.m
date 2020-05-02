clc
clear all
close all

t0 = 0;              %starting time
tmax = 1;            %ending time
N = 10;              %number of intervals 
x0 = 1;              %initial function value 
f = @(t, x) x;       %derivative function 
exact = @(t) exp(t); %exact solution for the differential equation 

dt = (tmax-t0)/N;        %step size
t = t0:dt:tmax;          %vector of t values at which to generate approximations
x = zeros(length(t), 1); %vector for storing approximations
x(1) = x0;               %initial function value

%output table setup
fprintf('Time\tApproximation\tExact\t\tError\n')
fprintf('t_j\tx_j\t\tx(t_j)\t\t|x_j-x(t_j)|\n')
fprintf('%.1f\t%.6f\t%.6f\t%.6f\t\n', t(1), x(1), exact(t(1)), abs(x(1)-exact(t(1))));

for j = 1:N;
    x(j+1) = x(j)+f(t(j), x(j))*dt; %new approximation using Euler's method
 
    fprintf('%.1f\t%.6f\t%.6f\t%.6f\t\n', t(j+1), x(j+1), exact(t(j+1)), abs(x(j+1)-exact(t(j+1))))
end
fprintf('\n')

%vector of t values for plotting
tt = t0:0.01:tmax;
plot(tt, exact(tt), 'k', t, x, '--or')
title('Exact Solution and Numerical Approximation via Euler''s method')
xlabel('t')
ylabel('x')
legend('Exact', 'Approximation', 'Location', 'Northwest')

%%
%investigation of global error

N = [5 10 20 40];            %vector of N values for comparing global error
error = zeros(1, length(N)); %vector to store global error
method = 'Euler''s';
fprintf(['N\tError for ' method ' method\n'])

figure
hold on
%loops through the various N values
for n = 1:length(N)
    %generates approximations using Euler's method
    dt = (tmax-t0)/N(n);
    t = t0:dt:tmax;
    x = zeros(length(t), 1); 
    x(1) = x0;

    for j = 1:N(n);
        x(j+1) = x(j)+f(t(j), x(j))*dt;
    end

    %calculates and outputs global error
    error(n) = max(abs(x-exact(t)'));
    fprintf('%d\t%.6f\n', N(n), error(n))
    
    %plots approximations
    plot(t, x, '--or', 'LineWidth', 2.5/n)
end

%plots approximations
tt = t0:0.01:tmax;
plot(tt, exact(tt), 'k', 'LineWidth', 3)
title(['Exact Solution and Numerical Approximations via ' method ' method'])
xlabel('t')
ylabel('x')
hold off
shg

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log(N), log(error), 1);

figure
loglog(N,error, 'k', 'LineWidth', 1.5)
xlabel('N')
ylabel('Global error')
title(['Global error for ' method ' method: Slope ' num2str(p(1))])
grid
axis tight
