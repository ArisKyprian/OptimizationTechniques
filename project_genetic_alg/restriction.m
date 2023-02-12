function flag = restriction(gene, V, c)
    flag = 0;
    if  gene(1) + gene(2) + gene(3) + gene(4) ~= V
        flag = 1;
    elseif  gene(1) - gene(5) - gene(6) ~= 0
        flag = 1;
    elseif  gene(2) - gene(7) - gene(8) ~= 0
        flag = 1;
    elseif  gene(3) + gene(8) + gene(9) - gene(11) - gene(12) - gene(13) ~= 0
        flag = 1;
    elseif  gene(4) - gene(9) - gene(10) ~= 0
        flag = 1;
    elseif  gene(6) + gene(7) + gene(13) - gene(14) - gene(15) ~= 0
        flag = 1;
    elseif  gene(10) + gene(11) - gene(17) ~= 0
        flag = 1;
    elseif  gene(5) + gene(14) - gene(16) ~= 0
        flag = 1;
    elseif  gene(12) + gene(15) + gene(16) + gene(17) ~= V
        flag = 1;
    end
    for i = 1:17
        if (gene(i) > c(i) || gene(i) < 0)
            flag = 1;
        end
    end
end