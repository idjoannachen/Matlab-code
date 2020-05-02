%% Problem 1

close all

%undamped
m = 1;
b = 0;
k = 16;
[t, x] = ode45(@springmass, [0 10], [1; 0], [], m, b, k);
grid on

plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Undamped spring-mass system')

%underdamped
m = 1;
b = 2;
k = 16;
[t, x] = ode45(@springmass, [0 10], [1; 0], [], m, b, k);
grid on

figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Underdamped spring-mass system')
grid on

%critically damped
m = 1;
b = 8;
k = 16;
[t, x] = ode45(@springmass, [0 10], [1; 0], [], m, b, k);

figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Critically damped spring-mass system')
grid on

%overdamped
m = 1;
b = 10;
k = 16;
[t, x] = ode45(@springmass, [0 10], [1; 0], [], m, b, k);

figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Overdamped spring-mass system')
grid on

%% Problem 2

[t, x] = ode45(@agingspring, [0 25], [2; 0]);
figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Aging spring')
grid on

%% Problem 3

[t, x] = ode45(@hardspring, [0 20], [0; 3]);
figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Hard spring')
grid on

%% Problem 4

[t, x] = ode45(@softspring, [0 20], [0; 3]);
figure
plot(t, x(:, 1), 'k', 'LineWidth', 2)
xlabel('t')
ylabel('x(t)')
title('Soft spring')
grid on
