close all; clear; 
syms x y
f(x,y) = 1/3 * x ^ 2 + 3 * y ^ 2; %choose a point and a step for each algorithm
point = [8 -10];
stepS = 0.1;
stepG = 0.2;
epsilon = 0.01;
[x1,y1] = steepest_descent_projection(f,point,stepG,stepS,epsilon); %steady step
F1 = f(x1,y1);

figure(1)
fcontour(f)
hold on
plot(x1,y1, '+', 'LineWidth', 2, 'MarkerSize', 10);
title("Steepest Descent Projection for stepS: " + stepS + " and stepG: " + stepG + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
xlabel("x1"); ylabel("x2");

figure(2)
plot(F1); xlabel('Repetitions'); ylabel('f(xk,yk)'); 
title("Steepest Descent Projection. StepS: " + stepS + ". StepG: " + stepG + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
