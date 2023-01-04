%Problem 1b
h = .05;
I = eye(10);
z = zeros(10, 10);
A = [-10, 10, 0, 0, 0, 0, 0, 0, 0, 0;
      10, -20, 10,0, 0, 0, 0, 0, 0, 0;
      0, 10, -20, 10,0, 0, 0, 0, 0, 0;
      0, 0, 10, -20, 10,0, 0, 0, 0, 0;
      0, 0, 0, 10, -20, 10,0, 0, 0, 0;
      0, 0, 0, 0, 10, -20, 10,0, 0, 0;
      0, 0, 0, 0, 0, 10, -20, 10,0, 0;
      0, 0, 0, 0, 0, 0, 10, -20, 10,0;
      0, 0, 0, 0, 0, 0, 0, 10, -20, 10;
      0, 0, 0, 0, 0, 0, 0, 0, 10, -10];
m1 = [z,I];
m2 = [A,z];
m = [m1;m2];
f = @(y) m*y;
y = [0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
y = transpose(y);
k1 = h.*f(y);
k2 = h.*f(y+0.5*k1);
k3 = h.*f(y+0.5*k2);
k4 = h.*f(y+k3);
approx = zeros(20, 160);
i = 1;
while i < 162
    approx(:,i) = y;
    k1 = h.*f(y);
    k2 = h.*f(y+0.5*k1);
    k3 = h.*f(y+0.5*k2);
    k4 = h.*f(y+k3);
    y = y + (k1 + 2*k2 + 2*k3 + k4)/6;
    i = i + 1;
end 

b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
a = approx(:,1);
x = a(1:10) + transpose(b);
y = transpose([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
plot1 = scatter(x,y,30,'fill');
xlim([0,11]);
ylim([-1 1]);
xlabel('x');
title('Spring Movement');
figure()
for k = 2:161
    a = transpose(approx(:,k));
    x = a(1:10) + b;
    plot1.XData = x;
    pause(.1*.01);
end

%Problem 1c
t = 0;
y = [0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
y = transpose(y);
h = 2^(-13);
k1 = h.*f(y);
k2 = h.*f(y+0.5*k1);
k3 = h.*f(y+0.5*k2);
k4 = h.*f(y+k3);
num = 8/h;
approx = zeros(20, num);
i = 1;
while i < num + 2
    approx(:,i) = y;
    k1 = h.*f(y);
    k2 = h.*f(y+0.5*k1);
    k3 = h.*f(y+0.5*k2);
    k4 = h.*f(y+k3);
    y = y + (k1 + 2*k2 + 2*k3 + k4)/6;
    i = i + 1;
end 
true = approx(:,num+1);
errors = zeros(9);
globals = zeros(9);
x = zeros(9);
for s=4:12
    h = 2^(-s);
    x(s-3) = h;
    globals(s-3) = h^4;
    num = 8/h;
    approx = zeros(20, num);
    i = 1;
    y = [0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    y = transpose(y);
    while i < num + 2
        approx(:,i) = y;
        k1 = h.*f(y);
        k2 = h.*f(y+0.5*k1);
        k3 = h.*f(y+0.5*k2);
        k4 = h.*f(y+k3);
        y = y + (k1 + 2*k2 + 2*k3 + k4)/6;
        i = i + 1;
    end
    estimate = approx(:,num+1);
    error = true - estimate;
    error1=0;
    for i=1:20
        error1 = error1 + abs(error(i));
    end
    errors(s-3) = norm(error1);
end 
loglog(x, errors);
hold on
loglog(x, globals);
legend('Real error', 'Expected Error');
title('R-K Real and Expected Error');
hold off




   




