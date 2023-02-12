function [a,b,counter,k] = golden_section(lambda,f)
    gamma = 0.618;
    a = -1;
    b = 3;
    k = 1;
    x1(k) = a + (1 - gamma)*(b - a);
    x2(k) = a + gamma * (b - a);
    Fx1 = f(x1(k));
    Fx2 = f(x2(k));
    counter = 2;

    while 1
        if (b(k) - a(k)) < lambda
            return
        end

        if Fx1 > Fx2
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            x2(k + 1) = a(k + 1) + gamma * (b(k + 1) - a(k + 1));
            x1(k + 1) = x2(k);
            Fx1 = Fx2;
            Fx2 = f(x2(k + 1));
            counter = counter + 1;
            k = k + 1;
        else
            a(k + 1) = a(k);
            b(k + 1) = x2(k);
            x1(k + 1) = a(k + 1) + (1 - gamma) * (b(k + 1) - a(k + 1));
            x2(k + 1) = x1(k);
            Fx2 = Fx1;
            Fx1 = f(x1(k + 1));
            counter = counter + 1;
            k = k + 1;
        end
    end
end