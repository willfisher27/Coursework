%Problem 2.1.6
N = 30;
f = @(x) 3*x-exp(x);
a = 1;
b = 2;
values = zeros(1,N);
for i = 1:N
        p = (a+b)/2;              
    values(i) = p;              
    if f(p)*f(a) > 0            
        a = p;                  
    else
        b = p;  
    end
end
fprintf('6a. Ans = %.6f\n', p);
f = @(x) x.^2-4*x+4-log(x);
a = 1;
b = 2;
values = zeros(1,N);
for i = 1:N
        p = (a+b)/2;              
    values(i) = p;              
    if f(p)*f(a) > 0            
        a = p;                  
    else
        b = p;  
    end
end
fprintf('6c. Ans1 = %.6f\n', p);
f = @(x) x.^2-4*x+4-log(x);
a = 2;
b = 4;
values = zeros(1,N);
for i = 1:N
        p = (a+b)/2;              
    values(i) = p;              
    if f(p)*f(a) > 0            
        a = p;                  
    else
        b = p;  
    end
end
fprintf('6c. Ans2 = %.6f\n', p);

%Problem 2.1.13
f = @(x) x.^3-25;
a = 2;
b = 3;
values = zeros(1,N);
for i = 1:N
        p = (a+b)/2;              
    values(i) = p;              
    if f(p)*f(a) > 0            
        a = p;                  
    else
        b = p;  
    end
end
fprintf('13. Ans = %.5f\n', p);

%Problem 2.1.15
N=14;
f = @(x) x.^3-x-1;
a = 1;
b = 2;
values = zeros(1,N);
for i = 1:N
        p = (a+b)/2;              
    values(i) = p;              
    if f(p)*f(a) > 0            
        a = p;                  
    else
        b = p;  
    end
end
fprintf('15. Ans = %.5f\n', p);
%Problem 2.2.7
TOL = 10^(-2);
Iter_Max = 100;
alpha = .25;

f = @(x) pi+0.5*sin(0.5*x);

a = 0;          
b = 2*pi;

xn_p_1 = pi; 
FP_error = 1;   
Iter = 0;
while FP_error > TOL && Iter < Iter_Max 
    Iter = Iter+1;
    xn = xn_p_1;
    xn_p_1 = f(xn);
    FP_error = abs(xn-xn_p_1);
end
fprintf('7. Approx = %.3d\n Iterations=%.1f\n', xn, Iter);

%Problem 1
expon = 0:.1:15;            
h = 10.^(-expon);           
x = .1;                     
fp_actual = exp(-x)*2*sin(x);        

f = @(z) cos(z).*exp(-z);            
fp = (f(x+h)-2*f(x)+f(x-h))./h.^2;      

relative_error = abs(fp - fp_actual)/abs(fp_actual);  

semilogy(expon,relative_error)  
                                
                                

xlabel('$-log_{10}(h)$','interpreter','latex','FontSize',15)    
ylabel('relative error','interpreter','latex','FontSize',15)
title('$D^2f(x) = \frac{f(x+h)-2f(x)+f(x-h)}{h^2}$','interpreter','latex','FontSize',15)
