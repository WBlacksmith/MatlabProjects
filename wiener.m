function [w] = wiener(x,y,L)
x = x(:); y = y(:);
rxx = xcorr(x,L);
rxy = xcorr(x,y,L);
rxx_matrix = toeplitz(rxx(L+1:end));
w = rxx_matrix\rxy(L+1:end);
end

