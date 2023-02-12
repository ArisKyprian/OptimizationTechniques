function mutated = mutation(population,sigma, V, c)
    mutated = [];
    [size_population,size_gene] = size(population);
    for i = 1:size_population
        if rand > 0.8
            continue;
        end
        shift = normrnd(0,sigma,[1,size_gene]);
        population(i,:) = population(i,:) + shift;
        mutated = cat(1,mutated, gene_calc(population(i,:), c, V));
    end
end