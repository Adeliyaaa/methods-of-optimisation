%f = @(x)( 2*x^2 - 9*x - 31 ); %функция
%df= @(x)( 4*x - 9); %ее производная
%f = @(x)(-2*sin(sqrt(abs(x./2 + 10))) - x.*sin(sqrt(abs(x- 10))));
%df = @(x)(-sin(sqrt(abs(x - 10))) - ((x/2 + 10) * cos(sqrt(abs(x/2 + 10))))/(2 * abs(x/2 + 10)^(3/2)) - ((x - 10) * x * cos(sqrt(abs(x - 10))))/(2 * abs(x - 10)^(3/2)));
f = @(x)(x.^2 -  10*cos(0.5*pi*x) - 110);
df = @(x)(2*x+5*pi*sin(0.5*pi*x));

interval = [-2, 10];
tol = 1e-10; %используется одинаковое значение для epsilon и delta

format long
[xmin, fmin, neval] = bisectionsearch(f,df,interval,tol)