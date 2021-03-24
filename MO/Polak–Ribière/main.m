%f = @himmelblau; 
%df = @df_himmelblau; 

%f = @rosenbrock; 
%df = @df_rosenbrock; 

f = @Sphere;
df = @df_sphere;

%f = @bukin;
%df = @df_bukin;

tol = 1e-10; 

format long;
[xmin, fmin, neval] = hen(f, df, [-5.12; 5.12], tol)