function [xmin, fmin, neval] = newtonmethod(f, interval, tol, x0, df, ddf)
neval = 0;
a = interval(1);
b = interval (2);
x1 = x0;
x2 = x1 - df(x1)/ddf(x1);
while (abs(x2-x1) > tol && abs(df(x2) - df(x1)) > tol)
    x1 = x2;
    x2 = x1 - df(x1)/ddf(x1);
    neval = neval + 1;
end

xmin = x2;
fmin = f(xmin);

