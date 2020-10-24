clear all; close all; clc;
% 10/23/20
% i stole most of this code from here: http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/

f = @(t,Y) [Y(2); -2*Y(1)-3*Y(2)];

y1 = linspace(-10,10,20);
y2 = linspace(-10,10,20);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid. Note that x and y are matrices of the same
% size and shape, in this case 20 rows and 20 columns
[x,y] = meshgrid(y1,y2);
size(x);
size(y);

u = zeros(size(x));
v = zeros(size(x));

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

quiver(x,y,u,v,'r'); figure(gcf)
xlabel('y_1')
ylabel('y_2')
axis tight equal;

y10=4;
hold on
for y20 = [3]
    [ts,ys] = ode45(f,[0,10],[y10;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off

'done'


% categories: ODEs
% tags: math
% credit for most of this code: http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/