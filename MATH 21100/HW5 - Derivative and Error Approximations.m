%Problem 1
f = @(x) 2*sin(5*x) + cos(3*x);
x = 0.5;
fp = @(x) 10*cos(5*x) - 3*sin(3*x);
error1 = @(y) abs(fp(y)-derivForwardDiff( f, y, x));
error2 = @(y) abs(fp(y)-deriv3PointMid( f, y, x));
error3 = @(y) abs(fp(y)-deriv5PointMid( f, y, x));
i = 1;
errors1 = zeros(1,20);
errors2 = zeros(1,20);
errors3 = zeros(1,20);
h_list = zeros(1,20);
while i <= 20
    h = 10^(-0.5*i);
    h_list(i) = h;
    errors1(i) = error1(h);
    errors2(i) = error2(h);
    errors3(i) = error3(h);
    i = i+1;
end
loglog(h_list, errors1)
hold on
loglog(h_list, errors2)
loglog(h_list, errors3)
hold off


%Problem 2
n = 20;
i = 0;
erf0 = zeros(1,11);
axis = zeros(1,11);
j = 1;
errors = zeros(1,11);
while j < 11
    x = (j-1)*0.5;
    erf0(j) = error_func(x,20);
    errors(j) = abs(erf(j)-erf(x));
    axis(j) = x;
    j = j+1;
end
plot(axis, erf0)
plot(axis, errors)

%

function deriv = derivForwardDiff( f, h, x)
    deriv = (f(x+h)-f(x))/h;
end
function deriv = deriv3PointMid( f, h, x)
    deriv = (f(x+h)-f(x-h))/(2*h);
end
function deriv = deriv5PointMid( f, h, x)
    deriv = (f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h))/(12*h);
end

function value = error_func(x,n)
    f = @(y) (2/sqrt(pi))*exp(-y^2);
    h = x/2;
    z = zeros(1,21);
    i= 0;
    while i < 21
    z(i+1) = i*(x/n);
    i = i+1;
    end
    i = 1;
    s = 0;
    while i < n
        y = z(i+1);
        s = s + f(y);
        i = i+1;
    end
    value = (h/2)*(f(0)+2*s+f(x));
end













