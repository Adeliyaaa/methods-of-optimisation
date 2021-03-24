function [xmin, fmin, k] = gradient(f,df,x0,tol,a)
% [xmin, fmin, neval] = gradient(f,interval,tol)
% Input arguments:
% f - an objective function handle
% dot = [x; y] - dot coordinates
% a - const
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
x1 = x0;
x2 = x1 - a * df(x1);
k = 1;

while (norm(x2 - x1) > tol)
    x1 = x2;
    x2 = x1 - a * df(x1);
    k = k + 1;
end

xmin = x2;
fmin = f(xmin);