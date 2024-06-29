function [x] = cholesky(A,b)
n=size(A,1);
L=zeros(n,n);
for i=1:n
   L(i, i) = sqrt(A(i, i) - L(i, :)*L(i, :)');
   for j=(i + 1):n
      L(j, i) = (A(j, i) - L(i,:)*L(j ,:)')/L(i, i);
   end
end
Lt=L';
y=L\b;
x=Lt\y;



