function [y,e,w] = lms(x,s,mu,L)
x = x(:); s = s(:);
M = length(x);  y = zeros(M,1); 
e = zeros(M,1); w = zeros(L,1);
for k = L:M
    xk = x(k:-1:k-L+1); 
    y(k) = w'*xk;  
    e(k) = s(k)-y(k); 
    w = w + 2*mu*e(k)*xk; 
end
