function [xk, yk] = steepest_descent_projection(f,point,stepG,stepS,epsilon)
    MAX_ITER = 500;
    syms x y;
    k = 1;
    xk(k) = point(1);
    yk(k) = point(2);
    X = [-10 5];
    Y = [-8 12];
    g = gradient(f, [x, y]);
    d = g(xk(k), yk(k));
    while (norm(d) > epsilon && k < MAX_ITER)
        d = -d;
        xkbar(k) = xk(k) + stepS * d(1);
        ykbar(k) = yk(k) + stepS * d(2);
        if xkbar(k) > X(2)
            xkbar(k) = X(2);
        elseif xkbar(k) < X(1)
            xkbar(k) = X(1);
        end
        if ykbar(k) > Y(2)
            ykbar(k) = Y(2);
        elseif ykbar(k) < Y(1)
            ykbar(k) = Y(1);
        end
        xk(k + 1) = xk(k) + stepG * (xkbar(k) - xk(k));
        yk(k + 1) = yk(k) + stepG * (ykbar(k) - yk(k));
        %stasimo(x,y) = transpose(g(xk(k + 1), yk(k + 1))) * [(x - xk(k + 1)); (y - yk(k + 1))];
        %disp(stasimo)

        k = k + 1;
        d = g(xk(k), yk(k));
    end
end