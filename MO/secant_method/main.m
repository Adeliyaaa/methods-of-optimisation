f = @(x)(x.^2 - 10.*cos(0.3*pi.*x) - 20);
df = @(x)(2.*x+3*pi*sin(0.3*pi.*x));
interval = [-2, 5];
tol = 0.001;

[xmin, fmin, neval] = secantmethod(f, interval, tol, df)

