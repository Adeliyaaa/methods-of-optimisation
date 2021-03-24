function val = rosenbrock(XY)
% F_ROSENBROCK is a Rosenbrock function
% 	val = ROSENBROCK(X)
%	INPUT ARGUMENTS:
%	XY - is 2x1 vector of input variables - x and y
%	OUTPUT ARGUMENTS:
%	val is a function value
x = XY(1);
y = XY(2);
val = (1 - x).^2 + 100*( y - x.^2).^2;
end