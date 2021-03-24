f = @(x)(2*x.^2 - 9*x - 31); %function
df= @(x)(4*x - 9); %its derivative
interval = [-2, 10];
tol = 1e-10; 

format long;
[xmin, fmin, neval] = fibonaccimethod(f, interval, tol);