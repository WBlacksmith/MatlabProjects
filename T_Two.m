function [] = T_Two(t,t1,t2,eeg,fs)
figure(5)
plot(t,eeg)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])

%=== Завдання #2.3 ===
% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag = fix(-200:200);
[r, lags]=xcorr(eeg, 'unbiased');
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (6)
plot(lags/fs,r)
xlabel('Lag (s)')
%=== Завдання #2.4 ===
% Обчислення середнього періоду та середньої частоти
 
%=== Завдання #2.5 ===
% Обчислення спектральної щільності сигналу
Sxx = abs(fft(eeg))/length(eeg);
Sxx = [Sxx(1);2*Sxx(2 : end - 1);Sxx(end)];
N = length(Sxx);
f = (0:(N-1))/N*fs;
figure (7)
plot(f,Sxx)
xlabel('');ylabel('')
end

