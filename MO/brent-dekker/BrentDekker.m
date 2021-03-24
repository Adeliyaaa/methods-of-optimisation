function [xmin, fmin, neval] = BrentDekker(f, df, interval, tol)
% BrentDekker searches for minimum using Brent-Dekker method
% [xmin, fmin, neval] = BrentDekker(f, interval, tol)
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
if df(interval(1)) * df(interval(2)) >= 0
    error('muellermethod. Error. For the specified search interval [a, b], the condition f''(a)*f''(b)<0 must be met.');
end
if tol <= 0
    error('muellermethod. Error. The error values tol must be greater than zero.');
end

% main stage
a = interval(1);
b = interval(2);
if abs(f(a)) < abs(f(b))
    temp = a;
    a = b;
    b = temp;
end
c = a;
flag = true; % true - использовался метод дихотомии, false - один из методов интерполяции
k = 0;
while  abs(df(b)) > tol || abs(b - a) > tol
    % reverse parabolic interpolation
    if f(a) ~= f(c) && f(b) ~= f(c)
        s = df(b)*df(c)/((df(a) - df(b))*(df(a) - df(c))) * a + ...
            df(a)*df(c)/((df(b) - df(a))*(df(b) - df(c))) * b + ...
            df(a)*df(b)/((df(c) - df(a))*(df(c) - df(b))) * c;
        % secant method
    elseif f(a) ~= f(b)
        s = b - df(b)*(b - a)/(df(b) - df(a));
    end
    % bisection method
    if (s < (3*a + b)/4 && s > b) || ...
            (flag == true && abs(b - c) <= tol) || ...
            (flag == true && abs(s - b) >= abs(b - c)/2) || ...
            (flag == false && abs(c - d) <= tol) || ...
            (flag == false && abs(s - b) >= abs(c - d)/2)
        s = (a + b) / 2;
        flag = true;
    else
        flag = false;
    end
    
    d = c; % d is assigned for the first time here; it won't be used above on the first iteration because flag is set
    c = b;
    if df(a)*df(s) < 0
        b = s;
    else
        a = s;
    end
    if abs(f(a)) < abs(f(b))
        temp = a;
        a = b;
        b = temp;
    end
    
    k = k + 1;
end
xmin = s;
fmin = f(xmin);
neval = k;
end
