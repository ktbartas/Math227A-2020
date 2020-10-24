clear all; close all; clc;
% 10/23/20
% i stole most of this code from here: http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/

f = @(t,Y) [5*Y(1)+2*Y(2); -17*Y(1)-5*Y(2)];

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
title('Phase plot for Math227A hw#3, problem 2B')