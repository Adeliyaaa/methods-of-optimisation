function v = df_bukin(X)
% DF_ROSENBROCK is a Rosenbrock function derivative
% 	v = DF_ROSENBROCK(X)
%	INPUT ARGUMENTS:
%	X - is 2x1 vector of input variables
%	OUTPUT ARGUMENTS:
%	v is a derivative function value
x = X(1);
y = X(2);

v = X;
v(1) = (0.01*(10 + x))/abs(10 + x) - (x*(-0.01*x.^2 + y))/abs(-0.01*x.^2 + y)^(3/2);
v(2) = (50*(-0.01*x^2 + y))/abs(-0.01*x.^2 + y)^(3/2);
end