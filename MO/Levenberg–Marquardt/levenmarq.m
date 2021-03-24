function [xmin, fmin, neval] = levenmarq(f, df, H, x0, tol)
% levenmarq searches for minimum using the Levenberg–Marquardt method
% [xmin, fmin, neval] = levenmarq(f, df, x0, tol)
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
  sigma = 1e-2;
  v = 5;
  
  dfX = df(x1);
  HX = H(x1);
  
  x2 = x1 - (HX + sigma*eye(2))\dfX;
  sigma = sigma / v;
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    
    dfX = df(x1);
    HX = H(x1);

    x2 = x1 - (HX + sigma*eye(2))\dfX;
    sigma = sigma / v;
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end