clc; clear;close all;
epsilon = 0.001;
lambda = 0.01;
syms f1(x);
f1(x) = (x - 2)^2 + x * log(x + 3);
syms f2(x);
f2(x) = 5^x  + (2 - cos(x))^2;
syms f3(x);
f3(x) = exp(x) * (x^3 - 1) + (x - 1) * sin(x);

L = double.empty(0,3);

a1 = cell(3,1);
b1 = cell(3,1);
Fcounter1 = int8.empty(0,3);
k1 = int8.empty(0,3);
a2 = cell(3,1);
b2 = cell(3,1);
Fcounter2 = int8.empty(0,3);
k2 = int8.empty(0,3);
a3 = cell(3,1);
b3 = cell(3,1);
Fcounter3 = int8.empty(0,3);
k3 = int8.empty(0,3);
for i = 1:3
    [a1{i}, b1{i}, Fcounter1(i), k1(i)] = fibonacciMethod(epsilon,lambda,f1);
    [a2{i}, b2{i}, Fcounter2(i), k2(i)] = fibonacciMethod(epsilon,lambda,f2);
    [a3{i}, b3{i}, Fcounter3(i), k3(i)] = fibonacciMethod(epsilon,lambda,f3);
    L(i) = lambda;
    lambda = lambda + 0.02;
end


for i = 1:3 %lambda = 0.01 0.03 0.05 and f1;
    figure(i)
    ab = [a1{i,1} ; b1{i,1}];
    k = 1:(k1(i)+2);
    scatter(k,ab); title("Fibonacci method for lambda = "+ L(i) + " and f1");
    xlabel('Step'); ylabel('Edges');
end

for i = 1:3 %lambda = 0.01 0.03 0.05 and f2;
    figure(i+3)
    ab = [a2{i,1} ; b2{i,1}];
    k = 1:(k2(i)+2);
    scatter(k,ab); title("Fibonacci method for lambda = "+ L(i) + " and f2");
    xlabel('Step'); ylabel('Edges');
end

for i = 1:3 %lambda = 0.01 0.03 0.05 and f3;
    figure(i+6)
    ab = [a3{i,1} ; b3{i,1}];
    k = 1:(k3(i)+2);
    scatter(k,ab); title("Fibonacci method for lambda = "+ L(i) + " and f3");
    xlabel('Step'); ylabel('Edges');
end

figure(10) %Calls of f for different lamda
bar(L, Fcounter1); title("Calls of f1 for different lambda");
xlabel("Lambda"); ylabel("Calls");

figure(11)
bar(L, Fcounter2); title("Calls of f2 for different lambda");
xlabel("Lambda"); ylabel("Calls");

figure(12)
bar(L, Fcounter3); title("Calls of f3 for different lambda");
xlabel("Lambda"); ylabel("Calls");
