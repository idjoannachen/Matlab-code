%% Lab 4

close all
clear all
clc

% defines an array of functions
%% TODO: set up phi (approximating sequence)
phi = {@(t) 1+t;
       @(t) 1+t+t.^2/2;
       @(t) 1+t+t.^2/2+t.^3/6;
       @(t) 1+t+t.^2/2+t.^3/6+t.^4/24};
%% TODO: set up exact soln
exact = @(t) exp(t);
   
t = 0:0.01:2;

for i = 1:length(phi)
    plot(t, phi{i}(t), 'k', 'LineWidth', 1+2*i/length(phi))
    hold on
end
plot(t, exact(t), 'r', 'LineWidth', 3)
hold off
xlabel('t')
ylabel('\phi_N(t)')
legend('Exact solution', 'Location', 'NorthWest')

figure
for i = 1:length(phi)
    plot(t, abs(exact(t)-phi{i}(t)), 'k', 'LineWidth', 1+2*i/length(phi))
    hold on
end
hold off
xlabel('t')
ylabel('Error')
