function v = df_rosenbrock(X)
% DF_ROSENBROCK is a Rosenbrock function derivative
% 	v = DF_ROSENBROCK(X)
%	INPUT ARGUMENTS:
%	X - is 2x1 vector of input variables
%	OUTPUT ARGUMENTS:
%	v is a derivative function value
v = [-2.*(1 - X(1,:)) + 200.*( X(2,:) - X(1,:).^2).*( - 2.*X(1,:));
200.*(X(2,:) - X(1,:).^2)];
end