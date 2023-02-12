function [a,b,counter,k] = dixotomouDerivative(lambda,f)
    k = 1;
    a = -1;
    b = 3;
    c = lambda/(b - a);
    i = 1;
    n = 1;
    g = diff(f);
    Gx = 0;
    counter = 0;

    while (1/2)^(i) > c
        i = i + 1;
        n = i;
    end
    
    while 1
        x(k) = (a(k) + b(k))/2;
        Gx = g(x(k));
        counter = counter + 1;
        if g(x(k)) == 0
            return
        elseif Gx > 0
            a(k + 1) = a(k);
            b(k + 1) = x(k);
        else
            a(k + 1) = x(k);
            b(k + 1) = b(k);
        end
        if k == n
            return
        end
        k = k + 1;
    end
end