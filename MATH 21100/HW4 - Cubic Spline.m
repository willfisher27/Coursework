%Problem 1

f = @(x) cos(5*cos(5*x));
iter = 0;
x = zeros(1,11);
y = zeros(1,11);
while iter < 11
    x(iter+1) = iter * 2 * pi * 0.1;
    y(iter+1) = f(x(iter+1));
    iter = iter + 1;
end
xx=0:.1:(2*pi);
yy = spline(x, y, xx);

x1= zeros(1,101);
y1= zeros(1,101);
iter=0;
while iter < 101
    x1(iter+1) = iter * 2 * pi * 0.01;
    y1(iter+1) = f(x1(iter+1));
    iter = iter + 1;
end
yy1 = spline(x1, y1, xx);
plot(x, y, 'o', xx, yy);
hold on
plot(x1, y1, 'b', xx, yy1);







