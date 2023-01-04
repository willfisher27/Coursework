%Problem 2.3.5
f = @(x) x^3-2*x.^2-5;
fp = @(x) 3*x.^2-4*x;
p0=3;
TOL = 1e-4;
a = Topic2_NM(f, fp, p0, TOL);
fprintf("2.3.5a Ans: %d\n", a);

f1 = @(x) x^3+3*x^2-1;
fp1 = @(x) 3*x^2+6*x;
p01 = -2.5;
TOL1 = 1e-4;
b = Topic2_NM(f1, fp1, p01, TOL1);
fprintf("2.3.5b Ans: %d\n", b);

%Problem 2.3.16
f = @(x) 0.5 + 0.25* x.^2 - x.*sin(x) - 0.5*cos(2*x);
fp = @(x) 0.5*x + sin(2*x) - x*cos(x) - sin(x);
p0 = 0.5 * pi;
p1 = 5 * pi;
p2 = 10 * pi;
TOL = 1e-5;
a = Topic2_NM(f, fp, p0, TOL);
b = Topic2_NM(f, fp, p1, TOL);
c = Topic2_NM(f, fp, p2, TOL);
fprintf("2.3.16 (p0=pi/2): %d\n", a);
fprintf("2.3.16 (p0=5pi): %d\n", b);
fprintf("2.3.16 (p0=10pi): %d\n", c);
%The unusual part of the result for Newton's Method is that so many
%iterations were required for the above results. In the first case, 15
%iterations were required, which is much more than usual. This is likely
%because f'(x) approaches zero as f(x) approaches its zero near 1.8955,
%which means more iterations are required to get within the tolerance
%bound. 

%Problem 1
Iter_max = 100;
TOL = 10^(-6);
f = @(x) x-0.1*(x^3-3);
fp = @(x) 1-0.3*x^2;
fpp = @(x) -0.6*x;
p0 = 1.5;
iter = 0;
p_n     = p0+1;             
p       = p0;
temp_max = 50;
while temp_max > iter
    p_n = p;
    p = p_n - f(p_n)/fp(p_n) - (fpp(p_n)/(2*fp(p_n)))*(f(p_n)/fp(p_n))^2;
    iter = iter + 1;
end
true = 3^(1/3);
error_terms1 = zeros(1,Iter_max);
error_terms2 = zeros(1,Iter_max);
error_terms3 = zeros(1,Iter_max);
iter = 0;
p_n     = p0+1;             
p       = p0;
while abs(p_n-p) > TOL && Iter_max > iter
    p_n = p;
    p = p_n - f(p_n)/fp(p_n) - (fpp(p_n)/(2*fp(p_n)))*(f(p_n)/fp(p_n))^2;
    iter = iter + 1;
    error = abs(p-true);
    error_terms1(iter)= error;
end
%%
iter = 0;
p_n     = p0+1;             
p       = p0;
while abs(true-p) > TOL && Iter_max > iter
    p_n = p;
    p   = p_n - f(p_n)/fp(p_n); 
    iter = iter+1;
    error = abs(p-true);
    error_terms2(iter)= error;
end
%%
iter = 0;
p_n     = p0+1;             
p       = p0;
while abs(p-true) > TOL && iter < Iter_max 
    iter = iter+1;
    p_n = p;
    p = f(p_n);
    error = abs(p-true);
    error_terms3(iter) = error;
end
semilogy(1:30,error_terms1(1:30))
hold on
semilogy(1:30,error_terms2(1:30))
semilogy(1:30,error_terms3(1:30))
legend('c', 'n', 'f')
hold off

%Problem 2
f = @(x) (cos(x)+sin(sqrt(2)*x))*exp(-x);
fp = @(x) exp(-x)*(-sin(x)+sqrt(2)*cos(sqrt(2)*x)-cos(x)+sin(sqrt(2)*x));
TOL = 10^(-10);
p0_1 = 2;
p0_2 = 4;
p0_3 = 8;
a = Topic2_NM(f, fp, p0_1, TOL, 5000);
b = Topic2_NM(f, fp, p0_2, TOL, 5000);
c = Topic2_NM(f, fp, p0_3, TOL, 5000);
fprintf("Problem 2 p1=%.10d\n", a);
fprintf("Problem 2 p2=%.10d\n", b);
fprintf("Problem 2 p3=%.10d\n", c);

