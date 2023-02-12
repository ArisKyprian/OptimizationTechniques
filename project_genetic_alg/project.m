clc; close all; clear;
c = [54.13 21.56 34.08 49.19 33.03 21.84 29.96 24.87 47.24 33.97 26.89 32.76 39.98 37.12 53.83 61.65 59.73];
a = [1.25 1.25 1.25 1.25 1.25 1.5 1.5 1.5 1.5 1.5 1 1 1 1 1 1 1];
V = 100;
population = zeros(100,17);
for i = 1:100
    population(i,:) = initialize(c,V);
end

number_of_generations = 1000;
fit_min_gen = zeros(number_of_generations,1);
fit_gen = zeros(number_of_generations,100);
w_chromosome = [];

for i = 1:number_of_generations
    children = crossover(population, V, c);
    children = mutation(children, 5, V, c);
    population = [population; children];
    [fit_min, fit_sum, fit_sum_reverse, chromo_index] = fitness(population,a,c);
    if find(fit_min_gen > fit_min,1) 
        w_chromosome = population(chromo_index,:);
    end
    [population, index] = selection(population,fit_sum_reverse);
    
    fit_min_gen(i) = fit_min;
    for j = 1:size(index,1)
        fit_gen(i,:) = fit_sum(index(j));
    end
end

for i = 1:number_of_generations
    fit_gen_mean(i) = mean(fit_gen(i,:));
end

figure(1)
plot(fit_min_gen);xlabel("Number of Generations");ylabel("Best Fitness of Chromosomes");

figure(2)
plot(fit_gen_mean);xlabel("Number of Generations");ylabel("Mean Fitness Per Gen");
