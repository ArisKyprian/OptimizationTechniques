function [xk, yk] = newton(point, caseN, step)
    epsilon = 0.001;
    k = 1;
    syms x y gammaK;
    f(x,y) = x^5 * exp(-x^2-y^2);
    xk(k) = point(1);
    yk(k) = point(2);
    g = gradient(f, [x, y]);
    h = hessian(f, [x, y]);
    H = h(xk(k), yk(k));
    G = g(xk(k), yk(k));
    disp(H)
    while sqrt(G(1)^2 + G(2)^2) > epsilon %for constant gamma
        G = g(xk(k), yk(k));
        H = h(xk(k), yk(k));
        
        d = -(inv(H))*G;
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
                while (f(xk(k), yk(k)) - f(xk(k + 1), yk(k + 1)) < -a * (b ^ m(k)) * s * transpose(d) * G)
                    m(k) = m(k) + 1;
                    gammaK = s * b ^ m(k);
                    xk(k + 1) = xk(k) + gammaK * d(1);
                    yk(k + 1) = yk(k) + gammaK * d(2);
                end
        end
        k = k + 1;
    end
end