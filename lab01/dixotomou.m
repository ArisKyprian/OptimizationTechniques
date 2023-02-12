function [a,b,counter,k] = dixotomou(epsilon,lambda,f)
    a = -1;
    b = 3;
    x1 = 0;
    x2 = 0;
    k = 1;
    Fx1 = 0;
    Fx2 = 0;
    counter = 0;

    while 1
        if b(k) - a(k) < lambda
            return 
        else 
            x1(k) = (a(k) + b(k))/2 - epsilon;
            x2(k) = (a(k) + b(k))/2 + epsilon;
        end
        Fx1 = f(x1(k));
        Fx2 = f(x2(k));
        counter = counter + 2;

        if Fx1 < Fx2
            a(k + 1) = a(k);
            b(k + 1) = x2(k);
        else
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
        end
        k = k + 1;
    end
    
end 