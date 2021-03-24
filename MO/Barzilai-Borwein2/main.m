f = @f_rosenbrock;
df = @df_rosenbrock;

x0 = [ 1.3; 2 ];
tol = 1e-3;

format long;
[xmin, fmin, neval] = BB2(f, df, x0, tol)