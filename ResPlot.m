function [ ] = ResPlot(fs,s,y,b)
figure(3)
subplot(3,1,1), plot(s),grid on
xlabel('s(n)');ylabel(' ')
xlim([0 100])
subplot(3,1,2), plot(y),grid on
xlabel('y(n)');ylabel(' ')
xlim([0 100])
% ----- АЧХ адаптивного фільтру
n = 512 ;  % кількість точок, що розраховуються
a = 1;
[h,w] = freqz(b,a,n);
mag = abs(h);
subplot(3,1,3), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 100])
end

