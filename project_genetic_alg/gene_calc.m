function gene = gene_calc(gene, c, V)
    gene(4) = V - gene(1) - gene(2) - gene(3);
    gene(6) = gene(1) - gene(5);
    gene(8) = gene(2) - gene(7);
    gene(10) = gene(4) - gene(9);
    gene(13) = gene(2) + gene(3) - gene(7) + gene(9) - gene(11) - gene(12);
    gene(15) = gene(6) + gene(7) + gene(13) - gene(14);
    gene(16) = gene(5) + gene(14);
    gene(17) = V - gene(12) - gene(15) - gene(16);
    if restriction(gene, V, c) == 1
        gene = [];
    end
end