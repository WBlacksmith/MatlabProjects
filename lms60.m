function [y,e,w] = lms60(x,d,mu)
M = length(x); 
y = zeros(1,M); 
e = zeros(1,M); 
w = [0; 0];
for k = 2:M
    y(k) = d(:,k)'*w;   
    e(k) = x(k) - y(k);
    w = w + 2*mu*e(k)*d(:,k);
end
