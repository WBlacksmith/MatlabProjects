function w = wiener_hopf(x,y,L)
x = x(:); y = y(:);
rxx = xcorr(x,L);		% обчислення АКФ 
rxy = xcorr(x,y,L); 		% обчислення ВКФ 
rxx_matrix = toeplitz(rxx(L+1:end));	% кореляційна матриця сигналу
w = rxx_matrix\rxy(L+1:end); 	% коефіцієнти фільтра