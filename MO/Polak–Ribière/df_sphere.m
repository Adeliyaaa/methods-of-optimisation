function v = df_sphere(X)

x = X(1);
y = X(2);

v = X;
v(1) = 2*x/899;
v(2) = 4*y/899;

end