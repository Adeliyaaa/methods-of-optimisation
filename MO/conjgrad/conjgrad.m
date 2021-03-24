function [xmin, fmin, neval] = conjgrad(f, df, H, x0, tol)
% conjgrad searches for minimum using the Conjugated Gradients method
% [xmin, fmin, neval] = conjgrad(f, df, H, x0, tol)
% input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% H - Hessian matrix function handle
% x0 - beginning point
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
  k = 1;
  x1 = x0;
  
  g1 = df(x1);
  p1 = g1/norm(g1);
  A = H(x1);
  
  sigma = -((g1')*p1)/(p1'*A*p1);
  x2 = x1 + sigma * p1;
  g2 = df(x2);
  beta = (g2'*A*p1)/(p1'*A*p1);
  p1 = -g2 + beta * p1;
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    A = H(x1);
    g1 = g2;
    
    sigma = -((g1')*p1)/(p1'*A*p1);
    x2 = x1 + sigma * p1;
    g2 = df(x2);
    beta = (g2'*A*p1)/(p1'*A*p1);
    p1 = -g2 + beta * p1;
    
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end