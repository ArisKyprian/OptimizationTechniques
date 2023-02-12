function children = crossover(population, V, c)
    [size_population,size_gene] = size(population);
    children = [];
    for i = 1:size_population
        if rand() > 0.8
            continue;
        end
        parent2 = randi(size_population);
        if parent2 == i
            continue;
        end
        position = randi(size_gene - 1);
        x1(1:position) = population(i, 1:position);
        x2(1:position) = population(parent2, 1:position);
        x1(position + 1: size_gene) = population(parent2, position + 1: size_gene);
        x2(position + 1: size_gene) = population(i, position + 1: size_gene);

        x1 = gene_calc(x1, c, V);
        x2 = gene_calc(x2, c, V);
        children = cat(1,children,x1,x2);
    end
end