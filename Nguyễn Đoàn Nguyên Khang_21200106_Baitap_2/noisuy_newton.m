function [result] = noisuy_newton(xa, ya, x)
n = length(xa);
da = ya;
for i = 1: n
    for j = 1: (i-1)
        da(i)=(da(j) - da(i))/(xa(j) - xa(i));
    end
end
m = length(da);
result = da(m);
for k = (m-1):-1:1
    result = result * (x - xa(k)) + da(k);
end