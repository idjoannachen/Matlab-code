%% Example 1 (with parameters)

%one approach is sending parameters through function

a = 2;
b = 1;
[t, x] = ode45(@(t, x) examplewithparameters(t, x, a, b), [0 5], 1);

plot(t, x, 'k', 'LineWidth', 4)
hold on
xlabel('t')
ylabel('x')

%another approach is sending parameters using ode45 (but notice that in
%this setup, an empty vector must be included before the list of parameters 
%which is used to specify ode45 options)

[t, x] = ode45(@examplewithparameters, [0 5], 1, [], a, b);

plot(t, x, 'r', 'LineWidth', 1.25)
hold off

%% Example 2a

[t, z] = ode45(@systemexample2a, [0 3], [1; 2]);

%solutions are saved in columns(!) of z

plot(t, z(:, 1), 'k', 'LineWidth', 2)
hold on
plot(t, z(:, 2), 'b', 'LineWidth', 2)
hold off
xlabel('t')
legend('x(t)', 'y(t)', 'Location', 'NorthWest')

%% Example 2b

[t, z] = ode45(@systemexample2b, [0 25], [0; 1]);

plot(t, z(:, 1), 'k', 'LineWidth', 2)
hold on
plot(t, z(:, 2), 'b', 'LineWidth', 2)
hold off
xlabel('t')
legend('x(t)', 'y(t)', 'Location', 'NorthEast')
