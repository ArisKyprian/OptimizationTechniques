close all; clear; 
syms x y
f(x,y) = 1/3 * x ^ 2 + 3 * y ^ 2; %choose a point and a step for each algorithm
point = [5 5]; 
steady_step = 5; %0.1 0.3 3 5   %for steady step

[x1,y1] = steepest_descent(point,1,steady_step); %steady step
F1 = f(x1,y1);

figure(1)
fcontour(f)
hold on
plot(x1,y1, '+', 'LineWidth', 2, 'MarkerSize', 10);
title("Steepest Descent for steady step: " + steady_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
xlabel("x"); ylabel("y");

figure(2)
plot(F1); xlabel('Repetitions'); ylabel('f(xk,yk)'); 
title("Steepest Descent. Steady Step: " + steady_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");

figure(3)
fsurf(f,'ShowContours','on'); xlabel("x"); ylabel("y"); zlabel("z");