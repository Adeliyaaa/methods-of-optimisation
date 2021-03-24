function [xmin, fmin, neval] = bisectionsearch(f,df,interval,tol)
% BISECTIONSEARCH searches for minimum using bisection method
% [xmin, fmin, neval] = BISECTIONSEARCH(f,df,interval,tol)
% input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% interval = [a, b] - search interval
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
curInterval = interval;
neval = 0;
xk = (curInterval(1)+curInterval(end))/2;
while (abs(df(xk)) > tol || abs(curInterval(end)-curInterval(1)) > tol)

    %starting with 1 and then increasing iterations by 1    
    neval = neval + 1;
         array(neval) = xk;
    if (df(xk) > 0)
        curInterval(end) = xk;
    else
        curInterval(1) = xk;
    end
    xk = (curInterval(1)+curInterval(end))/2;
end

xmin = xk;
fmin = f(xmin);

fplot(f, 'r');
hold on
plot(array, f(array), 'b-*');
