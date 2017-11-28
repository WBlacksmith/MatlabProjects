function lab05_main
%=== Дисципліна: Основи обробки біомедичної інформації ===
%--- Лабораторна робота #5 КОРЕЛЯЦІЙНИЙ АНАЛІЗ БІОСИГНАЛІВ
%
% Використовуйте файли даних: 
%   eeg1-c3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-f3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-f4.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-p3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-p4.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-o2.dat - сигнал ЕЕГ, fs = 100 Гц
%----------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #5')
disp('КОРЕЛЯЦІЙНИЙ АНАЛІЗ БІОСИГНАЛІВ')
disp('Виконав: Ковальчук В.І.  , група БМ - 461 ННІІДС')

%=== Завдання #1.1 ===
% Моделювання стаціонарного випадкового процесу
fs = 200; 
f0 = 5; 
A = 0.5; 
D = 0.25; 
N = 400; 
t = (0:(N-1))/fs;		% вектор часу 
s = A*cos(2*pi*f0*t); 
v = 2*rand(size(t))*D ;
x = s + v;
% Графіки отриманих сигналів
figure(1)
subplot(3,1,1), plot(s),grid on
xlabel('s(n)');ylabel(' ')
subplot(3,1,2), plot(v),grid on
xlabel('v(n)');ylabel(' ')
subplot(3,1,3), plot(x),grid on
xlabel('x(n)');ylabel(' ')

%=== Завдання #1.2 ===
% Обчислення оцінки дисперсії шуму, дисперсії сигналу та відношення шум/сигнал
Ds = var(s);
fprintf('Дисперсія сигналу =%4.3g\n', Ds);
Dv = var(v);
fprintf('Дисперсія шуму =%4.3g\n', Dv);
Vid = 10*log10(Dv/Ds);
fprintf('Відношення синалну до шуму,Дб =%4.3g\n',Vid);

%=== Завдання #1.3 ===
% Обчислення незміщеної оцінки АКФ змодельованого процесу  
maxlag = fix(-200:200);
[r, lags]=xcorr(x, 'unbiased');
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (2)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== Завдання #1.4 ===
% Обчислення зміщеної оцінки АКФ змодельованого процесу  
maxlag = fix(-300:300);
[r, lags]=xcorr(x, 'biased');
r = r(maxlag<0);
lags = lags(maxlag>0);
figure(3)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== Завдання #2.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.txt');% сигнал ЕКГ
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs; 
figure(4)
plot(t,eeg)
xlabel('time(s)');ylabel('Без фільтру')
xlim([1 1.5])

%=== Завдання #2.2 ===
% Виділення епохи сигналу ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 = 4.7;
t2 = 5.8;
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

%=== Завдання #2.6 ===
% Завантаження сигналу ЕЕГ файл (eeg1-f3.dat)
fs = 100;
eeg = load('eeg1-c3.txt');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs; 
figure(7)
plot(t,eeg)
xlabel('time(s)');ylabel('Без фільтру')
xlim([1 1.5])

% Виділення епохи сигналу ЕЕГ від t1 = 4,2 с до t2 = 4,96 с
t1 = 4.2; 
t2 = 4.96;
T_Two(t,t1,t2,eeg,fs)

% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
...

% Обчислення середнього періоду та середньої частоти

% Обчислення спектральної щільності сигналу
...

%=== Завдання #3.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-o2.dat)
fs = 100;
eeg1 = load('eeg1-o2.txt');
eeg1 = detrend(eeg1);
t = (0:length(eeg1)-1)/fs; 
figure(8)
plot(t,eeg1)
% Завантаження сигналу ЕЕГ файл (eeg1-c3.dat)
eeg2 = load('eeg1-c3.txt');
eeg2 = detrend(eeg2);
figure(9)
plot(t,eeg2)
%=== Завдання #3.2 ===
% Виділення епохи сигналів ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 5.8;
t2 = 6.7;
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

%=== Завдання #3.5 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p3.dat)
eeg1 = load('eeg1-p3.txt');
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
eeg2 = load('eeg1-p4.txt');
t1 = 4.8;
t2 = 5.7;
T_Three(t1,t2,eeg1,eeg2)
%=== Завдання #3.6 ===
% Завантаження сигналу ЕЕГ файл (eeg1-f3.dat)
eeg1 = load('eeg2-f3.txt');
% Завантаження сигналу ЕЕГ файл (eeg1-f4.dat)
eeg2 = load('eeg1-f4.txt');
t1 = 4.2;
t2 = 4.9;
T_Three(t1,t2,eeg1,eeg2)

