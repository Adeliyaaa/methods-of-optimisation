function v = f_rosenbrock(X)
% F_ROSENBROCK is a Rosenbrock function
% 	v = F_ROSENBROCK(X)
%	INPUT ARGUMENTS:
%	X - is 2x1 vector of input variables
%	OUTPUT ARGUMENTS:
%	v is a function value
v = (1 - X(1,:)).^2 + 100.*( X(2,:) - X(1,:).^2).^2;
end