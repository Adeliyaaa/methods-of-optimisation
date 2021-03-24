function val = bukin(XY)
% F_ROSENBROCK is a Rosenbrock function
% 	val = ROSENBROCK(X)
%	INPUT ARGUMENTS:
%	XY - is 2x1 vector of input variables - x and y
%	OUTPUT ARGUMENTS:
%	val is a function value
x = XY(1);
y = XY(2);
val = 100*sqrt(abs(y-0.01*x.^2)) + 0.01*abs(x+10);
end