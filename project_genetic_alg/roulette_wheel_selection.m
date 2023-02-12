function index =  roulette_wheel_selection(fit_percent)
    len = length(fit_percent);
    for i = 1:len
        fit_per_sum(i) = sum(fit_percent(1:i)); 
    end
    i = 1;
    stop = rand;
    while fit_per_sum(i) < stop
        i = i + 1;
    end
    index = i;
end