%% Problem 1

clc
clear all
close all

t0 = 0;              %starting time
tmax = 2;            %ending time
x0 = 1;              %initial function value
f = @(t, x) t-x;       %derivative function

% (a) Euler's
method = 'Euler''s ';

%investigation of global error

N = [4 8 16 32 64];          %vector of N values for comparing global error
error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method ' method\n'])

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
    fprintf('%d\t%.4f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

figure
loglog((tmax-t0)./N,error, 'k', 'LineWidth', 1.5)
hold on

%(b) RK2
method = 'RK2';

%investigation of global error

error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method '\n'])

%loops through the various N values
for n = 1:length(N)
    %generates approximations using Euler's method
    dt = (tmax-t0)/N(n);
    t = t0:dt:tmax;
    x = zeros(length(t), 1); 
    x(1) = x0;

    for j = 1:N(n);
        m1 = f(t(j), x(j));
        m2 = f(t(j+1), x(j)+dt*f(t(j), x(j)));
        x(j+1) = x(j)+dt*(m1+m2)/2;
    end
    
    %calculates and outputs global error
    error(n) = max(abs(x-exact(t)'));
    fprintf('%d\t%.6f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

loglog((tmax-t0)./N,error, 'b', 'LineWidth', 1.5)

% (c) RK4
method = 'RK4';

%investigation of global error

error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method '\n'])

%loops through the various N values
for n = 1:length(N)
    %generates approximations using Euler's method
    dt = (tmax-t0)/N(n);
    t = t0:dt:tmax;
    x = zeros(length(t), 1); 
    x(1) = x0;

    for j = 1:N(n);
        m1 = f(t(j), x(j));
        m2 = f(t(j)+dt/2, x(j)+m1*dt/2);
        m3 = f(t(j)+dt/2, x(j)+m2*dt/2);
        m4 = f(t(j)+dt, x(j)+m3*dt);
        x(j+1) = x(j)+dt*(m1+2*m2+2*m3+m4)/6;
    end
    
    %calculates and outputs global error
    error(n) = max(abs(x-exact(t)'));
    fprintf('%d\t%.8f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

loglog((tmax-t0)./N,error, 'r', 'LineWidth', 1.5)
xlabel('log dt')
ylabel('log error')
title('Comparison of global error for Euler''s, RK2, RK4')
grid
axis tight
legend('Euler''s', 'RK2', 'RK4')
hold off
shg

%% Problem 2

clc
clear all
close all

t0 = 1;              %starting time
tmax = 2;            %ending time
x0 = 1;              %initial function value
f = @(t, x) t./(x+1);       %derivative function
exact = @(t) sqrt(t.^2+3)-1; %exact solution for the differential equation

% (a) Euler's
method = 'Euler''s ';

%investigation of global error

N = [4 8 16 32 64];          %vector of N values for comparing global error
error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method ' method\n'])

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
    fprintf('%d\t%.4f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

figure
loglog((tmax-t0)./N,error, 'k', 'LineWidth', 1.5)
hold on

%(b) RK2
method = 'RK2';

%investigation of global error

error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method '\n'])

%loops through the various N values
for n = 1:length(N)
    %generates approximations using Euler's method
    dt = (tmax-t0)/N(n);
    t = t0:dt:tmax;
    x = zeros(length(t), 1); 
    x(1) = x0;

    for j = 1:N(n);
        m1 = f(t(j), x(j));
        m2 = f(t(j+1), x(j)+dt*f(t(j), x(j)));
        x(j+1) = x(j)+dt*(m1+m2)/2;
    end
    
    %calculates and outputs global error
    error(n) = max(abs(x-exact(t)'));
    fprintf('%d\t%.8f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

loglog((tmax-t0)./N,error, 'b', 'LineWidth', 1.5)

% (c) RK4
method = 'RK4';

%investigation of global error

error = zeros(1, length(N)); %vector to store global error
fprintf(['N\tError for ' method '\n'])

%loops through the various N values
for n = 1:length(N)
    %generates approximations using Euler's method
    dt = (tmax-t0)/N(n);
    t = t0:dt:tmax;
    x = zeros(length(t), 1); 
    x(1) = x0;

    for j = 1:N(n);
        m1 = f(t(j), x(j));
        m2 = f(t(j)+dt/2, x(j)+m1*dt/2);
        m3 = f(t(j)+dt/2, x(j)+m2*dt/2);
        m4 = f(t(j)+dt, x(j)+m3*dt);
        x(j+1) = x(j)+dt*(m1+2*m2+2*m3+m4)/6;
    end
    
    %calculates and outputs global error
    error(n) = max(abs(x-exact(t)'));
    fprintf('%d\t%.12f\n', N(n), error(n))
end
fprintf('\n')

%adding loglog plot
%calculates slope on loglog plot
p = polyfit(log((tmax-t0)./N), log(error), 1);

loglog((tmax-t0)./N,error, 'r', 'LineWidth', 1.5)
xlabel('log dt')
ylabel('log error')
title('Comparison of global error for Euler''s, RK2, RK4')
grid
axis tight
legend('Euler''s', 'RK2', 'RK4')
hold off
shg