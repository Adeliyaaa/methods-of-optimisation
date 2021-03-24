%f = @(x)(x(1,:).^4 + x(2,:).^4 + x(1,:).*x(2,:));
%df= @(x)( [4.*x(1,:).^3 + x(2,:) ; 4.*x(2,:).^3 + x(1,:) ]);
%f = @(x) ((x-5).^4 + 5);
%df = @(x) (4 .* (x - 5).^3);
%f = @(x) x.^2 - 10 .* cos(0.3.*pi.*x) - 20;
%df = @(x) 2.*x + 10.*sin(0.3.*pi.*x)*0.3*pi;
%f = @f_himmelblau;
%df = @df_himmelblau;
f = @f_rosenbrock;
H = @H_rosenbrock;
df = @df_rosenbrock;

x0 = [ -2; -2 ];
tol = 1e-3;

format long;
[xmin, fmin, neval] = newton(f, df, H, x0, tol)
%[xmin, fmin, neval] = nesternemir(f, df, H, x0, tol)
%[xmin, fmin, neval] = levenmarq(f, df, H, x0, tol)

%[xmin, fmin, neval] = mueller(f,df,[-2,3],tol)