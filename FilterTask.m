function [] = FilterTask(fs,x,b,s)
a = 1;
y = filter(a,b,x);
figure(1)
subplot(3,1,1), plot(x),grid on
xlabel('x(n)');ylabel(' ')
subplot(3,1,2), plot(s),grid on
xlabel('s(n)');ylabel(' ')
subplot(3,1,3), plot(y),grid on
xlabel('Відфільтрований сигнал y(n)');ylabel(' ')
%АЧХ
n = 512;  % кількість точок, що розраховуються
[h,w] = freqz(b,a,n);
mag = abs(h);
figure(2)
subplot(1,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 100])
end

