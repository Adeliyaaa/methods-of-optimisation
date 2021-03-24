function [xmin, fmin, neval] = reverseParabolicInterpolation(f, df, interval, tol)
% MUELLERMETHOD searches for minimum using Mueller's method
% [xmin, fmin, neval] = MUELLERMETHOD(f, interval, tol)
% input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% interval = [a, b] - search interval
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations

% initial stage
a = interval(1);
b = interval(2);

if df(a) * df(b) >= 0
    error('muellermethod. Error. For the specified search interval [a, b], the condition f''(a)*f''(b)<0 must be met.');
end
if tol <= 0
    error('muellermethod. Error. The error values tol must be greater than zero.');
end

% main stage
x0 = a;
x1 = b;
x2 = (x0 + x1) / 2;
k = 1;
while true   
    xk1 = df(x1)*df(x2)/((df(x0) - df(x1))*(df(x0) - df(x2))) * x0 + ...
        df(x0)*df(x2)/((df(x1) - df(x0))*(df(x1) - df(x2))) * x1 + ...
        df(x0)*df(x1)/((df(x2) - df(x0))*(df(x2) - df(x1))) * x2;
    
    if abs(xk1 - x2) < tol || abs(df(xk1) - df(x2)) <= tol
        break;
    end
    
    if df(xk1) > 0
        x1 = x2;
    else
        x0 = x2;
    end
    x2 = xk1;
    
    k = k + 1;
end
xmin = xk1;
fmin = f(xmin);
neval = k;
end
