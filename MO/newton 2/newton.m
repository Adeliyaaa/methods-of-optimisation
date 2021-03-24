function [xmin, fmin, neval] = newton(f, df, H, x0, tol)
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
  sigma = 1;
  
  dfX = df(x1);
  HX = H(x1);
  
  x2 = x1 - sigma * HX\dfX;
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    
    dfX = df(x1);
    HX = H(x1);

    x2 = x1 - sigma * HX\dfX;
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end