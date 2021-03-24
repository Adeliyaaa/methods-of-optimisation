function val = himmelblau(XY)
% F_HIMMELBLAU is a Himmelblau function
% 	val = HIMMELBLAU(X)
%	INPUT ARGUMENTS:
%	XY - is 2x1 vector of input variables - x and y
%	OUTPUT ARGUMENTS:
%	value is a function value
x = XY(1);
y = XY(2);
val = (x.^2 + y  - 11).^2 + (x + y.^2 - 7).^2;
end