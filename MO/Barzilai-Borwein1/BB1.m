function [xmin, fmin, neval] = BB1(f,df,x0,tol)
%BB1 searches for minimum using Barzilai-Borwein 1 method
%   [xmin, fmin, neval] = BB1(f,df,x0,tol)
%   INPUT ARGUMENTS
%   f is a function handle
%   df is a gradient function handle
%   x0 - starting point
%   tol - tolerance for both range and function value
%   OUTPUT ARGUMENTS
%   xmin is a function minimizer
%   fmin = f(xmin)
%   neval - number of function evaluations
df0 = feval(df,x0);
g = df0/norm(df0);
f1dim = @(al)norm(al*x0 - g);
interval = [-3;3];
[al,~,~] = goldenratiomethod(f1dim,interval,tol);
al = al/norm(df0);
deltaX = tol;
k = 1;
Kmax = 1000;
while(norm(deltaX) >= tol) && (k < Kmax)
    x1 = x0 - al*df0;
    df1 = feval(df,x1);
    deltaX = x1 - x0;
    deltaF = df1 - df0;
    al = (deltaX'*deltaX) / (deltaX'*deltaF);
    
    df0 = df1;
    x0 = x1;
    k = k + 1;
end
xmin = x1;
fmin = feval(f,xmin);
neval = k;
end