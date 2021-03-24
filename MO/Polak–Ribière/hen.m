function [xmin, fmin, neval] = hen(f,df,x0,tol)
% hen searches for minimum using 
% 	[xmin, fmin, neval, coordinates] = hen(f,df,x0,tol)
%   INPUT ARGUMENTS
% 	f is a function handle
% 	df is a gradient function handle
%   x0 is a starting point
% 	tol is a tolerance for both range and function value
%   OUTPUT ARGUMENTS
% 	xmin is a function minimizer
% 	fmin = f(xmin)
% 	neval is a number of function evaluations

neval = 0;
df0=df(x0);
g0=df0;
s0=-g0;
interval = [-10;10];

while(norm(g0) >= tol)
    f1 = @(al)(f(x0 + al*s0));
    [alpha,~,~] = goldenratiomethod(f1,interval,tol);
    
    x1 = x0 + alpha*s0;
    
    g = df(x1);
    
    %b = ((g-g0)'*g)/(g'*g);
   b = -(g'*(g-g0))/(s0'*(g-g0)); %coeff
    
    if (b < 0)
        b=0;
    end
    s = -g + b * s0;
    
    if(norm(x1-x0)<tol)
        break;
    end
    x0 = x1;
    
    g0 = g;
    s0 = s;
    neval = neval + 1;
end

xmin = x1;
fmin = f(xmin);
end