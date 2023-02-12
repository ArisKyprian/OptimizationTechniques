function [fit_min, fit_sum, fit_sum_reverse, index] = fitness(population, a, c)
    [size_population,size_gene] = size(population);
    fit = zeros(size_population,size_gene);
    fit_sum = zeros(size_population,1);
    fit_sum_reverse = zeros(size_population,1);
    fit_min = 10000000;
    for i = 1:size_population
        for j = 1:size_gene
                fit(i,j) = a(j) * population(i,j) / (1 - (population(i,j) / c(j)));
        end
        fit_sum(i) = sum(fit(i,:));
        if fit_sum(i) < fit_min
            fit_min = fit_sum(i);
            index = i;
        end
        fit_sum_reverse(i) = 1 / fit_sum(i);
    end
end