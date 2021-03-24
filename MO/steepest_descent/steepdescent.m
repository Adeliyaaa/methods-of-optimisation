function [xmin, fmin, neval] = steepdescent(f, df, x0, tol)
% steepdescent searches for minimum using the steep descent method
% [xmin, fmin, neval] = steepdescent(f, df, x0, tol)
% input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% x0 - beginning point
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
  k = 1;
  x1 = x0;
  
  dfX = df(x1);
  lf = (@(l) f(x1 - l * dfX));
  [sigma, ~, ~] = goldensectionsearch(lf,[-10, 10],tol);
  x2 = x1 - sigma * dfX;
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    
    dfX = df(x1);
    lf = (@(l) f(x1 - l * dfX));
    [sigma, ~, ~] = goldensectionsearch(lf,[-10, 10],tol);
    x2 = x1 - sigma * dfX;
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end