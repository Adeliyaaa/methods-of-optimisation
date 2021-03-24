function [xmin, fmin, neval] = fletcherreeves(f, df, x0, tol)
% fletcherreeves searches for minimum using the Fletcher-Reeves Conjugated Gradents method
% [xmin, fmin, neval] = fletcherreeves(f, df, x0, tol)
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
  
  g1 = df(x1);
  p1 = g1/norm(g1);
  
  
  [sigma, ~, ~] = goldensectionsearch((@(a) f(x1 + a*p1)),[-10, 10],tol);
  x2 = x1 + sigma * p1;
  g2 = df(x2);
%  beta = (g2'*g2)/(p1'*p1);  % Fletcher-Reeves formula
  beta = ((g2-g1)'*g2)/(p1'*p1);  % Polak-Ribiere formula
  p1 = -g2 + beta * p1;
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    g1 = g2;
    
    [sigma, ~, ~] = goldensectionsearch((@(a) f(x1 + a*p1)),[-10, 10],tol);
    x2 = x1 + sigma * p1;
    g2 = df(x2);
%    beta = (g2'*g2)/(p1'*p1);
    beta = ((g2-g1)'*g2)/(p1'*p1);
    p1 = -g2 + beta * p1;
    
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end