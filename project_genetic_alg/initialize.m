function gene = initialize(c, V)
    gene = zeros(17,1);
    for i = 1:17
        if i == 4
            gene(i) = V - gene(1) - gene(2) - gene(3);
        elseif i == 6
            gene(i) = gene(1) - gene(5);
        elseif i == 8
            gene(i) = gene(2) - gene(7);
        elseif i == 10
            gene(i) = gene(4) - gene(9);
        elseif i == 13
            gene(i) = gene(2) + gene(3) - gene(7) + gene(9) - gene(11) - gene(12);
        elseif i == 15
            gene(i) = gene(6) + gene(7) + gene(13) - gene(14);
        elseif i == 16
            gene(i) = gene(5) + gene(14);
        elseif i == 17
            gene(i) = V - gene(12) - gene(15) - gene(16);
        else 
            gene(i) = c(i) * rand;
        end
    end
    for i = 1:17
        if (gene(i) < 0 || gene(i) > c(i))
            gene = initialize(c, V);
        end
    end
end