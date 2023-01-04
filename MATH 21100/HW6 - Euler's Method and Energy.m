

%1c
h=0.01;
a=1;
b=6;
num_steps=(b-a)/h;
x=1:num_steps;
x(1)=1;
p=1:num_steps;
p(1)=1;
for i= 2:num_steps+1
    p(i) = p(i-1) - 5*h*x(i-1);
    x(i) = x(i-1) + h*p(i-1);
end
h=0.001;
a=1;
b=6;
num_steps1=(b-a)/h;
x1=1:num_steps1;
x1(1)=1;
p1=1:num_steps1;
p1(1)=1;
errors = 1:num_steps;
errors1 = 1:num_steps;
for i =2:num_steps1+1
    p1(i) = p1(i-1) - 5*h*x1(i-1);
    x1(i) = x1(i-1) + h*p1(i-1);
    if mod(i-2, 10) == 0
        errors((i-2)/10+1) = abs(x1(i-1)-x((i-2)/10+1));
        errors1((i-2)/10+1) = abs(p1(i-1)-p((i-2)/10+1));
    end
end

plot(1:.01:5.99, errors);
hold on
plot(1:.01:5.99, errors1);
legend('x(t) error', 'p(t) error')
hold off
figure()

%1d
C = [0,0];
a = 2;
E = 0.4 * sqrt(5);
b = a*sqrt(1-E^2);
th = linspace(0,2*pi);
xe = C(1)+b*cos(th) ; 
ye = C(2)+a*sin(th) ;
plot(xe,ye,'b')
axis equal
hold on
plot1 = scatter(x(1),p(1),30,'fill');
plot2 = scatter(x1(1),p1(1),30,'fill');
xlim([-3 3]);
ylim([-3 3]);
xlabel('x')
ylabel('p')
title('1d')
legend('ellipse', 'step=0.01', 'step=0.001')
for k = 2:num_steps 
     plot1.XData = x(k);
     plot1.YData = p(k);
     plot2.XData = x1(10*(k-1));
     plot2.YData = p1(10*(k-1));
     pause(.25*.01);
end
hold off


