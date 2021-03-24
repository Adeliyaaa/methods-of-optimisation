function [xmin, fmin, neval] = muellermethod(f, df, interval, tol)
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
    w = (df(x2) - df(x1))/(x2 - x1) + (df(x2) - df(x0))/(x2 - x0) - (df(x1) - df(x0))/(x1 - x0);
    fp = ((df(x2) - df(x1))/(x2 - x1) - (df(x1) - df(x0))/(x1 - x0))/(x2 - x0);
    r = sqrt(w^2 - 4*df(x2)*fp); % root expression
    if abs(w + r) >= abs(w - r)
        den = w + r;
    else
        den = w - r;
    end
    xk1 = x2 - 2*df(x2) / den;
    
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



%     w = (f(x2) - f(x1))/(x2 - x1) + (f(x2) - f(x0))/(x2 - x0) - (f(x1) - f(x0))/(x1 - x0);
%     fp = ((f(x2) - f(x1))/(x2 - x1) - (f(x1) - f(x0))/(x1 - x0))/(x2 - x0);
%     r = sqrt(w^2 - 4*f(x2)*fp); % root expression


%     if f(x0) < f(x1)
%        x2 = x1;
%     elseif f(x2) < f(x1)
%        x0 = x1;
%     elseif f(x1) <= f(x0) && f(x0) <= f(x2)
%     elseif f(x1) <= f(x2) && f(x2) <= f(x0)
%     end
%     x1 = xk1;
    
%     if xk >= x0 && xk <= x1
%         x2 = x1;
%         x1 = xk;
%     elseif xk > x1 && xk <= x2
%         x0 = x1;
%         x1 = xk;
%     end

