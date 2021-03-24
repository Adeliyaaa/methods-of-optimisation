f = @(x)(x.^2 - 10.*cos(0.3*pi.*x) - 20);
df = @(x)(2.*x+3*pi*sin(0.3*pi.*x));
ddf = @(x)(0.9*pi^2*cos(0.3*pi.*x)+2);
interval = [-2, 7];
x0 = 1.3;
tol = 0.01;

[xmin, fmin, neval] = newtonmethod(f, interval, tol, x0, df, ddf)

