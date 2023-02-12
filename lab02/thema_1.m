syms x y
f(x,y) = x^5 * exp(-x^2-y^2);
fsurf(f,'ShowContours','on'); xlabel("x"); ylabel("y"); zlabel("z");