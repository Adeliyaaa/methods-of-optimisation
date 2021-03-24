function [xmin, fmin, k] = fibonaccimethod(f,interval,tol)
% FIBONACCIMETHOD searches for minimum using Fibonacci method
% [xmin, fmin, neval] = FIBONACCIMETHOD(f,interval,tol)
% input arguments:
% f - an objective function handle
% interval = [a, b] - search interval
% Output arguments:
% xmin - minimum
% fmin - function value at minimum,
% neval - number of function evaluations

a = interval(1);
b = interval(2);
n = 1;

while (fibonacci(n) < (b - a) / tol)
    n = n + 1;
end
n = n + 1;

l = a + fibonacci(n - 2) * (b - a) / fibonacci(n);
u = a + fibonacci(n - 1) * (b - a) / fibonacci(n);

k = 1;

while (k < n - 1) 
   if (f(l) < f(u))
      b = u;
      u = l;
      l = a + (fibonacci(n - k - 2)) * (b - a) / fibonacci(n - k);
   else
       a = l;
       l = u; 
       u = a + (fibonacci(n - k - 1) * (b - a)) / fibonacci(n - k);
   end
   k = k + 1;
end

u = l + tol;
if (f(l) > f(u))
    xmin = (l + b) / 2;
else
    xmin = (a + u) / 2;
end

fmin = f(xmin);