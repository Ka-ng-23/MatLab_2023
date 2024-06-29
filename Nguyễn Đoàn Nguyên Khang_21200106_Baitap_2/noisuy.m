function result = noisuy(xa, ya, x, h)
xt=x;
n = length(xa);
syms x;
da = ya;
for i = 1: n
    for j = 1: (i-1)
        da(i)=(da(j) - da(i))/(xa(j) - xa(i));
    end
end
m = length(da);
r = da(m);
for k = (m-1):-1:1
    r = r * (x - xa(k)) + da(k);
end
rs = diff(r);
result = double(subs(rs, x, xt));

% function [result] = noisuy(xa, ya, x, h)
% xt=x;
% n = length(xa);
% syms x;
% da = ya;
% for i = 1: n
%     for j = 1: (i-1)
%         da(i)=(da(j) - da(i))/(xa(j) - xa(i));
%     end
% end
% m = length(da);
% result = da(m);
% for k = (m-1):-1:1
%     result = result * (x - xa(k)) + da(k);
% end
