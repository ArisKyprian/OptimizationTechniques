function [newpopulation, index] = selection(population, fitness)
    [size_population, size_gene] = size(population);
    fitness_sum = sum(fitness);
    fit_percent = fitness / fitness_sum;
    newpopulation = zeros(100, size_gene);
    index = zeros(100,1);
    for i = 1:100
        index(i) = roulette_wheel_selection(fit_percent);
        while find(index(1:i-1) == index(i)) ~= 0
            index(i) = roulette_wheel_selection(fit_percent);
        end
        newpopulation(i,:) = population(index(i),:);
    end
end