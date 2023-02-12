function [xk, yk] = steepest_descent(point,caseN,step)
    syms x y gammaK;
    f(x,y) = 1/3 * x ^ 2 + 3 * y ^ 2;
    epsilon = 0.001;
    k = 1;
    xk(k) = point(1);
    yk(k) = point(2);
    g = gradient(f, [x, y]);
    d = g(xk(k), yk(k));
    while sqrt(d(1)^2 + d(2)^2) > epsilon && k <  100
        d = -d;
        switch caseN
            case 1
                gammaK = step; 
                xk(k + 1) = xk(k) + gammaK * d(1);
                yk(k + 1) = yk(k) + gammaK * d(2);
            case 2
                fg(gammaK) = f(xk(k) + gammaK * d(1), yk(k) + gammaK * d(2));
                gamma = dixotomouDerivative(0,step,fg);
                xk(k + 1) = xk(k) + gamma * d(1);
                yk(k + 1) = yk(k) + gamma * d(2);
            case 3
                a = 0.1;
                b = 0.5;
                s = step;
                m(k) = 0;
                gammaK = s * b ^ m(k);
                xk(k + 1) = xk(k) + gammaK * d(1);
                yk(k + 1) = yk(k) + gammaK * d(2);
                while (f(xk(k), yk(k)) - f(xk(k + 1), yk(k + 1)) < -a * (b ^ m(k)) * s * transpose(d) * (-d))
                    m(k) = m(k) + 1;
                    gammaK = s * b ^ m(k);
                    xk(k + 1) = xk(k) + gammaK * d(1);
                    yk(k + 1) = yk(k) + gammaK * d(2);
                end
        end
        k = k + 1;
        d = g(xk(k), yk(k));
    end
end
