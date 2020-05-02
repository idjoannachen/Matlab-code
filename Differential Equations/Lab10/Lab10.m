%% Problem 1a

P0 = 10:10:150;

r = 0.4;
N = 100;
H = 2;

for i = 1:length(P0)
    [t, P] = ode45(@LogisticWithHarvesting, [0 25], P0(i), [], r, N, H);

    plot(t, P, 'k', 'LineWidth', 2)
    xlabel('t')
    ylabel('P(t)')
    hold on
end
hold off

%% Problem 1b

r = 0.15;
N = 1000;
H = 1;

figure(1);
for i = 1:length(P0)
    [t, P] = ode45(@LogisticWithHarvesting, [0 80], P0(i), [], r, N, H);

    plot(t, P, 'k', 'LineWidth', 2)
    xlabel('t')
    ylabel('P(t)')
    hold on
end
hold off

%% Problem 1c

r = 0.5;
N = 50;
H = 4;
figure(2);
for i = 1:length(P0)
    [t, P] = ode45(@LogisticWithHarvesting, [0 25], P0(i), [], r, N, H);

    plot(t, P, 'k', 'LineWidth', 2)
    xlabel('t')
    ylabel('P(t)')
    hold on
end
hold off

%% Problem 2a

[t, z] = ode45(@problem2a, [0 1], [-1; 2]);
figure(3);
plot(t, z(:, 1), 'k', 'LineWidth', 2)
hold on
plot(t, z(:, 2), 'b', 'LineWidth', 2)
hold off
xlabel('t')
legend('x(t)', 'y(t)', 'Location', 'NorthWest')

%% Problem 2b
figure(4);
[t, z] = ode45(@problem2b, [0 2], [1; 2]);

plot(t, z(:, 1), 'k', 'LineWidth', 2)
hold on
plot(t, z(:, 2), 'b', 'LineWidth', 2)
hold off
xlabel('t')
legend('x(t)', 'y(t)', 'Location', 'NorthWest')
