function [xmin, fmin, neval] = secantmethod(f, interval, tol, df)
neval = 0;
a = interval(1);
b = interval (2);
while (1)
    x = b - df(b)*(b-a)/(df(b) - df(a))
        neval = neval + 1

    if (df(x) <= tol && abs(b-a) <= tol)
        break;
    end
    if (df(x) > 0)
        b = x;
    else
        a = x;
    end
end
xmin = x;
fmin = f(xmin);

