close all; clear; 
syms x y
f(x,y) = x^5 * exp(-x^2-y^2); %choose a point and a step for each algorithm
point = [1 -1]; %[0 0] [-1 1] [1 -1]
steady_step = 5; %0.1 0.5 5   %for steady step
max_search = 15; %1 5 10 15       %for dixotomouDerivative
first_step = 10; %1 5 10        %for Armijo

[x1,y1] = levenberg(point,1,steady_step); %steady step
F1 = f(x1,y1);

[x2,y2] = levenberg(point,2,max_search); %elaxistopoiisi
F2 = f(x2,y2);

[x3,y3] = levenberg(point,3,first_step); %armijo
F3 = f(x3,y3);

figure(1)
fcontour(f)
hold on
plot(x1,y1, '+', 'LineWidth', 2, 'MarkerSize', 10);
title("Levenberg for steady step: " + steady_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
xlabel("x"); ylabel("y");

figure(2)
plot(F1); xlabel('Repetitions'); ylabel('f(xk,yk)'); 
title("Levenberg. Steady Step: " + steady_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");

figure(3)
fcontour(f)
hold on
plot(x2,y2, '+', 'LineWidth', 2, 'MarkerSize', 10);
title("Levenberg for dixotomouDerivative max search: " + max_search + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
xlabel("x"); ylabel("y");

figure(4)
plot(F2); xlabel('Repetitions'); ylabel('f(xk,yk)'); 
title("Levenberg. Max search on dixotomou derivative: " + max_search + ". Starting Point: [" + point(1) +" "+ point(2) + "]");

figure(5)
fcontour(f)
hold on
plot(x3,y3, '+', 'LineWidth', 2, 'MarkerSize', 10);
title("Levenberg for Armijo first step: " + first_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");
xlabel("x"); ylabel("y");

figure(6)
plot(F3); xlabel('Repetitions'); ylabel('f(xk,yk)'); 
title("Levenberg. Armijo first step: " + first_step + ". Starting Point: [" + point(1) +" "+ point(2) + "]");