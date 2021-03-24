function [xmin, fmin, neval] = nesternemir(f, df, H, x0, tol)
% nesternemir searches for minimum using the Nesterov-Nemirovski method
% [xmin, fmin, neval] = nesternemir(f, df, x0, tol)
% input arguments:
% f - an objective function handle
% df -  an objective function derivative handle
% x0 - beginning point
% tol - set for bot range and function value
% output arguments:
% xmin - minimizator
% fmin - value at minimum point,
% neval - number of function evaluations
  
  function a = modifier(decr)
    if (decr <= 0.25)
      a = 1;
    else
      a = 1/(1+decr);
    end
  end
  
  k = 1;
  x1 = x0;
  sigma = 1;
  
  dfX = df(x1);
  HX = H(x1);
  decrement = (dfX'*inv(HX)*dfX)^0.5;

  x2 = x1 - modifier(decrement) * (HX\dfX);
  while (norm(x2 - x1) >= tol && k<10000)
    x1 = x2;
    
    dfX = df(x1);
    HX = H(x1);
    decrement = (dfX'*inv(HX)*dfX)^0.5;

    x2 = x1 - modifier(decrement) * (HX\dfX);
    k = k + 1;
  end
  
  xmin = x2;
  neval = k;
  fmin = f(xmin);
  end