function [xk, yk] = levenberg(point, caseN, step)
    epsilon = 0.001;
    syms x y gammaK;
    f(x,y) = x^5 * exp(-x^2-y^2);
    k = 1;
    xk(k) = point(1);
    yk(k) = point(2);
    g = gradient(f, [x, y]);
    h = hessian(f, [x, y]);
    G = g(xk(k), yk(k));
    while sqrt(G(1)^2 + G(2)^2) > epsilon %for constant gamma
        G = g(xk(k), yk(k));
        H = h(xk(k), yk(k));
        Hpd = (H + transpose(H))/2; %wasnt needed, i did that thinking that H wasnt always symmetric, still works
        eigenvalues = eig(Hpd);
        if eigenvalues(1) > 0 && eigenvalues(2)> 0 
            mk = 0;
        else
            mk = max(abs(eigenvalues(1)),abs(eigenvalues(2))) + 1;
        end
        %disp(mk)
        d = -(inv(H + mk * eye(2))) * G;
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