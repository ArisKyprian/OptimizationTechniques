function [a,b,counter,k] = fibonacciMethod(epsilon, lambda, f)
    k = 1;
    a = -1;
    b = 3;
    c = (b - a)/lambda;
    n = 1;
    i = 1;
    
    while fibonacci(i) < c
        i = i + 1;
        n = i;
    end
    n = n - 1; % cause fibonacci in matlab starts from 1

    x1 = a + (fibonacci(n-2)/fibonacci(n)) * (b - a);
    x2 = a + (fibonacci(n-1)/fibonacci(n)) * (b - a);
    Fx1 = f(x1(k));
    Fx2 = f(x2(k));
    counter = 2;

    while 1

        if Fx1 > Fx2 % bima 2 else bima 3
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            x1(k + 1) = x2(k);
            x2(k + 1) = a(k + 1) + (fibonacci(n - k - 1 + 1)/fibonacci(n - k + 1)) * (b(k + 1) - a(k + 1));
            if (k == (n - 2)) %bima 5 else bima 4
                x1(n) = x1(n - 1);
                x2(n) = x1(n - 1) + epsilon;
                Fx1 = Fx2;
                Fx2 = f(x2(n));
                counter = counter + 1;
                if Fx1 > Fx2
                    a(n) = x1(n);
                    b(n) = b(n - 1);
                else 
                    a(n) = a(n - 1);
                    b(n) = x2(n);
                end
                return
            else %bima 4
                Fx1 = Fx2;
                Fx2 = f(x2(k + 1));
                counter = counter + 1;
                k = k + 1;
            end
        else %bima 3
            a(k + 1) = a(k);
            b(k + 1) = x2(k);
            x1(k + 1) = a(k + 1) + (fibonacci(n - k - 2 + 1)/fibonacci(n - k + 1)) * (b(k + 1) - a(k + 1));
            x2(k + 1) = x1(k);
            if (k == (n - 2)) %bima 5 else bima 4
                x1(n) = x1(n - 1);
                x2(n) = x1(n - 1) + epsilon;
                Fx1 = f(x1(n));
                Fx2 = f(x2(n));
                counter = counter + 2;
                if Fx1 > Fx2
                    a(n) = x1(n);
                    b(n) = b(n - 1);
                else 
                    a(n) = a(n - 1);
                    b(n) = x2(n);
                end
                return
            else %bima 4
                Fx2 = Fx1;
                Fx1 = f(x1(k + 1));
                counter = counter + 1;
                k = k + 1;
            end
        end
    end    
end