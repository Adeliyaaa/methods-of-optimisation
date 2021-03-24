f = @(x)(2*x.^2 - 9*x - 21);
df = @(x)(4*x - 9);
interval = [-2, 10];
tol = 1e-10; 

format long;
[xmin, fmin, neval] = threedotsearch(f, df, interval, tol);