%f = @himmelblau; %+1 neval
%df = @df_himmelblau; 

f = @rosenbrock; 
df = @df_rosenbrock; 

a = 0.001;
tol = 0.001; 

format long;
[xmin, fmin, neval] = gradient(f, df, [1.3; 2], tol, a)