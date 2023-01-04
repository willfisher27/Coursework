%Problem 1.2.10
syms x;
sum_a = eval(symsum(1/factorial(x),x, 0, 5));
abs_error_a = abs(exp(1)-sum_a);
rel_error_a = abs_error_a/exp(1);
fprintf('10a. abs_error = %d\n', abs_error_a);
fprintf('10a. rel_error = %d\n', rel_error_a);

syms y;
sum_b = eval(symsum(1/factorial(y),y, 0, 10));
abs_error_b = abs(exp(1)-sum_b);
rel_error_b = abs_error_b/exp(1);
fprintf('10b. abs_error = %d\n', abs_error_b);
fprintf('10b. rel_error = %d\n', rel_error_b);

%Problem 1.2.15
s_a = 0;
c_a = 2+2^3+2^10;
f_a = 0.5 + 0.5^4 + 0.5^7 + 0.5^8;
n_a = (-1)^s_a*2^(c_a-1023)*(1+f_a);
fprintf('15a: %d\n', n_a);

s_b = 1;
c_b = 2+2^3+2^10;
f_b = 0.5 + 0.5^4 + 0.5^7 + 0.5^8;
n_b = (-1)^s_b*2^(c_b-1023)*(1+f_b);
fprintf('15b: %d\n', n_b);

%Probelm 1.3.10
n = 5; 
a = 1 : n; 
x0 = .1; 
y = a(n);
for i = 1:n-1
    y = y*x0+a(n-i);
end

fprintf('P(x0)=%d\n', y);



