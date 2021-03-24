function [xmin, fmin, neval] = goldensectionsearch(f, interval, tol)
% GOLDENSECTIONSEARCH searches for minimum using golden section method
% [xmin, fmin, neval] = goldensectionsearch(f, interval, tol)
% input arguments:
% f - an objective function handle
% interval = [a, b] - search interval
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations

% initial stage
if tol <= 0
    error('goldensectionsearch. Error. The error values tol must be greater than zero.');
end

% main stage
curInterval = interval;
F = (1 + sqrt(5))/2;
% intermediate points
x1 = curInterval(2) - (curInterval(2) - curInterval(1)) / F; 
x2 = curInterval(1) + (curInterval(2) - curInterval(1)) / F;
fx1 = f(x1);
fx2 = f(x2);
k = 2;
while abs(curInterval(2) - curInterval(1))> tol % checking the stopping criterion the search
    % the reduction of the current interval
    if fx1 > fx2
        curInterval(1) = x1; 
        x1 = x2;
        fx1 = fx2;
        x2 = curInterval(1) + (curInterval(2) - curInterval(1)) / F;
        fx2 = f(x2);
    else
        curInterval(2) = x2;
        x2 = x1;
        fx2 = fx1;
        x1 = curInterval(2) - (curInterval(2) - curInterval(1)) / F;
        fx1 = f(x1);
    end
        
    k = k + 1; % count of number of iterations
end
xmin = (curInterval(1) + curInterval(2)) / 2;
fmin = f(xmin);
neval = k;
end

