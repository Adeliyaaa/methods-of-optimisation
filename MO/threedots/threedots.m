function [xmin, fmin, neval] =  threedots(f, df, interval, tol)
% THREEDOTS searches for minimum using threedots method of search
% [xmin, fmin, neval] = threedotsearch(f, df, interval, tol)
% Input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% interval = [a, b] - search interval
% Output arguments:
% xmin - minimum
% fmin - function value at minimum point,
% neval - number of function evaluations

a = interval(1);
b = interval(2);
xm = (a + b) / 2;
fxm = f(xm);
L = abs(b - a);
i = 1;
while L > tol
    x1 = a + L/4;
    x2 = b - L/4;
    fx1 = f(x1);
    fx2 = f(x2);
    
    if (fx1 < fxm)
        b = xm;
        xm = x1;
        fxm = fx1;
        
    elseif (fx1 >= fxm && fx2 >= fxm)
        a = x1;
        b = x2;
    else
        a = xm;
        xm = x2;
        fxm = fx2;
    end
    
    i = i + 1;
    L = abs(b - a);
end
xmin = xm;
fmin = f(xmin);
neval = i;
end

