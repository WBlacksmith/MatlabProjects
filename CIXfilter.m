%Дослідження властивостей простого режекторного фільтру
function [] = CIXfilter()
fs = 1000;
b =	[1 2 1];	% коефіцієнти різницевого рівняння 
a = 1;
n = 512;	% кількість точок, що розраховуються
[h,w] = freqz(b,a,n);
mag = abs(h);
phase = angle(h)*180/pi;
figure(10)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 500])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 500])
end

