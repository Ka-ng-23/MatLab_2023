function [result] = Lagrange(xa, ya, x, h)
    x1=x;
    syms x;
    n = length(xa);
    sum = 0;
    for i=1:n
        product = ya(i);
        for j = 1:n
            if i ~= j
                product = product*(x - xa(j))/(xa(i) - xa(j));
            end
        end
        sum = sum + product;
    end
    rs = diff(sum);
    result = double(subs(rs, x, x1));