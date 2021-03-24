function [xmin, fmin, neval] = goldenratiomethod(f, interval, tol)
% GOLDENRATIOMETHOD searches for minimum using golden section method
% [xmin, fmin, neval] = goldensectionsearch(f, interval, tol)
% input arguments:
% f - an objective function handle
% interval = [a, b] - search interval
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
a = interval(1);
b = interval(2);
F = (1 + sqrt(5))/2;
x1 = b - (b - a) / F; 
x2 = a + (b - a) / F;
fx1 = f(x1);
fx2 = f(x2);
k = 2;
while (abs(b - a)> tol) 
  
    if (fx1 > fx2)
        a = x1; 
        x1 = x2;
        fx1 = fx2;
        x2 = a + (b - a) / F;
        fx2 = f(x2);
    else
        b = x2;
        x2 = x1;
        fx2 = fx1;
        x1 = b - (b - a) / F;
        fx1 = f(x1);
    end
    k = k + 1; 
end
xmin = (a + b) / 2;
fmin = f(xmin);
neval = k;
end

