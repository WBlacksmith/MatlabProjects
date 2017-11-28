function [ ] = T_Three(t1,t2,eeg1,eeg2)
fs = 100;
eeg1 = detrend(eeg1);
t = (0:length(eeg1)-1)/fs;
eeg2 = detrend(eeg2);
figure(8)
plot(t,eeg1)
figure(9)
plot(t,eeg2)

figure(10)
subplot(2,1,1), plot(t,eeg1)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])
subplot(2,1,2), plot(t,eeg2)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])

%=== Завдання #3.3 ===
% Обчислення ВКФ сигналів ЕЕГ
maxlag = fix(-200:200);
[r, lags]=xcorr(eeg1, eeg2);
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (11)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== Завдання #3.4 ===
% Обчислення взаємної спектральної щільності сигналів ЕЕГ
Sx = abs(fft(eeg1))/length(eeg1);
Sx = [Sx(1);2*Sx(2 : end - 1);Sx(end)];
Sy = abs(fft(eeg2))/length(eeg2);
Sy = [Sy(1);2*Sy(2 : end - 1);Sy(end)];
N = length(Sx);
Sxx = Sx + Sy;
f = (0:(N-1))/N*fs;
figure (12)
plot(f,Sxx)
xlabel('');ylabel('')
end

