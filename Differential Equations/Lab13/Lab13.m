% Lab 13: Nonlinear predator-prey system

%% Problem 1: no fishing

close all
clear all
clc

a = 0.4;
b = 0.01;
c = 0.3;
d = 0.005;

%  x' = f(x,y);
f = @(x, y) a*x-b*x.*y;
%  y' = g(x,y);
g = @(x, y) -c*y+d*x.*y;

%window range
xmin = 0;
xmax = 100;
xstep = 5;
ymin = 0;
ymax = 100;
ystep = 5;

%creates points at which to plot direction arrows
[x,y] = meshgrid(xmin:xstep:xmax, ymin:ystep:ymax);

%saves components of direction arrows (dx, dy)
dx = f(x,y); 
dy = g(x,y);

%calculates magnitude of and saves normalized direction arrow (ndx, ndy)
r = (dx.^2 + dy.^2).^0.5;
ndx = dx./r;
ndy = dy./r;

%sets scale for plotting arrows
scale = 0.5;

%plots normalized direction arrow (ndx,ndy) at point (x,y)
figure
subplot(1,2,1);
quiver(x,y,ndx,ndy,scale,'k')
axis([xmin xmax ymin ymax])
s = func2str(f);
var1 = s(3);
var2 = s(5);
xlabel(var1) 
ylabel(var2)
hold on

tmin = 0;
tmax = 100;

x0 = [50; 30];

[~, x] = SolutionCurves([tmin tmax], x0, f, g); 
    
plot(x(:, 1), x(:, 2), 'k', 'LineWidth', 2)   
hold off

subplot(1,2,2);
[t, x] = SolutionCurves([tmin tmax], x0, f, g);
    
plot(t, x(:, 1), 'k', 'LineWidth', 2)
hold on
plot(t, x(:, 2), 'b', 'LineWidth', 2)
xlabel('t')
ylabel('Populations')
legend('Prey', 'Predator', 'Location', 'SouthWest')
hold off

%% Problem 2: fishing

close all
clear all
clc

a = 0.4;
b = 0.01;
c = 0.3;
d = 0.005;
e = [0 0.02 0.04 0.06];

tmin = 0;
tmax = 100;

x0 = [50; 30];

%window range
xmin = 0;
xmax = 110;
xstep = 5;
ymin = 0;
ymax = 80;
ystep = 5;

for i = 1:length(e)

    ei = e(i);
    %  x' = f(x,y);
    f = @(x, y) a*x-b*x.*y-e(i)*x;
    %  y' = g(x,y);
    g = @(x, y) -c*y+d*x.*y-e(i)*y;

    %creates points at which to plot direction arrows
    [x,y] = meshgrid(xmin:xstep:xmax, ymin:ystep:ymax);

    %saves components of direction arrows (dx, dy)
    dx = f(x,y); 
    dy = g(x,y);

    %calculates magnitude of and saves normalized direction arrow (ndx, ndy)
    r = (dx.^2 + dy.^2).^0.5;
    ndx = dx./r;
    ndy = dy./r;

    %sets scale for plotting arrows    
    scale = 0.5;

    %plots normalized direction arrow (ndx,ndy) at point (x,y)
    figure
    subplot(1,2,1);
    quiver(x,y,ndx,ndy,scale,'k')
    axis([xmin xmax ymin ymax])
    s = func2str(f);
    var1 = s(3);
    var2 = s(5);
    xlabel(var1) 
    ylabel(var2)
    title(['e = ' num2str(e(i))])
    hold on

    [~, x] = SolutionCurves([tmin tmax], x0, f, g); 
    
    plot(x(:, 1), x(:, 2), 'k', 'LineWidth', 2)   
    hold off

    subplot(1,2,2);
    [t, x] = SolutionCurves([tmin tmax], x0, f, g);
    
    plot(t, x(:, 1), 'k', 'LineWidth', 2)
    hold on
    plot(t, x(:, 2), 'b', 'LineWidth', 2)
    xlabel('t')
    ylabel('Populations')
    legend('Prey', 'Predator', 'Location', 'SouthWest')
    title(['e = ' num2str(e(i))])
    hold off
end
