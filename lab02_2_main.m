function lab02_main
%=== Дисципліна: Основи обробки біомедичної інформації ===
%--- Лабораторна робота #2 ФІЛЬТРАЦІЯ БІОСИГНАЛІВ ФІЛЬТРАМИ З СІХ
%
% Використовуйте файли даних: 
% ecg117.dat - сигнал EКГ 
% ecg_2х60.dat - сигнал ЕКГ з мережевою перешкодою частотою 60 Гц
%----------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #2')
disp('ФІЛЬТРАЦІЯ БІОСИГНАЛІВ ФІЛЬТРАМИ З СІХ')
disp('Виконав: ..., група ... ІАСУ')

%=== Завдання #1.1 ===
% Реалізація фільтру Хеннінга, обчислення АЧХ та ФЧХ
fs = 1000;
b =	[1 2 1];	% коефіцієнти різницевого рівняння 
a = 1;
n = 512;	% кількість точок, що розраховуються
[h,w] = freqz(b,a,n);
mag = abs(h);
phase = angle(h)*180/pi;
figure(1)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 500])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 500])
%Згідно графіками частота зрізу = 490Гц
%=== Завдання #1.2 ===
% Обчислення нулів фільтру
% З різницевого рівняння фільтра Хенінга отримуємо передавальну функцію
% H(z)= 1/4[1+2(z^(-1))+z^(-2)]
% Звільнившись від від`ємних степенів отримуємо перед. функцію у
% канонічному вигляді: H(z)=(z^2 + 2z +1)/(4(z^2))
% Аби знайти нулі фільтра прирівнюємо до нуля вираз у чисельнику
% передавальної функції і знаходимо корені
disp('Нулі фільтра Хеннінга') 
p = [1 2 1];
x = roots(p);
% x1 = -1, x2 = 1.
%=== Завдання #1.3 ===
% Фільтрація ЕКГ, файл ecg117.dat
fs = 1000;
b =	[1 2 1];	% коефіцієнти різницевого рівняння 
a = 1;
ecg = load('ecg117.dat');	% сигнал ЕКГ
ecg = detrend(ecg);
ecgf = filter(b,a,ecg);
t = (0:length(ecg)-1)/fs; 
figure(2)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf)
xlabel('time(s)');ylabel('З фільтром Хеннінга')
xlim([1 1.5])

%=== Завдання #2.1 ===
%Реалізація фільтру поліноміального згладжування
fs = 1000;
bp = [-3 12 17 12 -3];		% коефіцієнти різницевого рівняння
ap = 1;
n =  5;% кількість точок, що розраховуються
[h,w] = freqz(bp,ap,n);
mag = abs(h);
phase = angle(h)*180/pi;
figure(3)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 400])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 400])
% Обчислення нулів фільтру
xb = roots(bp);
yb = roots(ap);
% Карта нулів та полюсів фільтру
figure(4)
zplane(xb,yb);
%=== Завдання #2.2 ===
%Фільтрація ЕКГ файл ecg117.dat з використанням фільтру 
%поліноміального згладжування
ecg = load('ecg117.dat');	% сигнал ЕКГ
ecg = detrend(ecg);
ecgf5 = filter(bp,ap,ecg);
t = (0:length(ecg)-1)/fs; 
figure(5)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf5)
xlabel('time(s)');ylabel('З поліномальним фільтром')
xlim([1 1.5])

%=== Завдання #2.3 ===
%Порівняння властивостей згладжування сигналу фільтром Хеннінга 
%і поліноміальним фільтром
figure(6)
subplot(2,1,1), plot(t,ecgf)
xlabel('time(s)');ylabel('З фільтром Хеннінга')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf5)
xlabel('time(s)');ylabel('З поліномальним фільтром')
xlim([1 1.5])

%=== Завдання #3.1 ===
% Дослідження властивостей простого режекторного фільтру
br =  [1 0.618 1];  % коефіцієнти різницевого рівняння 
ar = 1;
n =  3;	% кількість точок, що розраховуються
fs = 200;
[h,w] = freqz(br,ar,n,fs);
mag = abs(h);
phase = angle(h)*180/pi;
figure(7)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 400])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 400])
% Обчислення нулів фільтру
xr = roots(br);
yr = roots(ar);
% Карта нулів та полюсів фільтру
figure(8)
zplane(xr,yr);
% Побудова передавальної функції
H = filt (br, ar)
%=== Завдання #3.2 ===
% Фільтрація сигналу ЕКГ (файл ecg2х60.dat) режекторним фільтром
fs = 250;
ecg = load('ecg2x60.dat');		% сигнал ЕКГ
ecg = detrend(ecg);
ecgrf = filter(br,ar,ecg);
t = (0:length(ecg)-1)/fs; 	
figure(9)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgrf)
xlabel('time(s)');ylabel('З режекторним фільтром')
xlim([1 1.5])

%=== Завдання #4.1 ===
% Дослідження властивостей диференціаторів
% N = 1
fs = 1000;
bd1 = [1 1];		% коефіцієнти різницевого рівняння 
ad1 = 1;
n = 2;		 % кількість точок, що розраховуються
[h,w] = freqz(bd1,ad1,n,fs);
mag = abs(h);
phase = angle(h)*180/pi;
figure(10)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 400])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 400])

% N = 2
bd2 =  [1 1];  	% коефіцієнти різницевого рівняння 
ad2 = 2;
n = 2;	  % кількість точок, що розраховуються
[h,w] = freqz(bd2,ad2,n,fs);
mag = abs(h);
phase = angle(h)*180/pi;
figure(11)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 400])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 400])

% Побудова передавальних функцій
H1 = filt (bd1, ad1)
H2 = filt (bd2, ad2)

%=== Завдання #4.2 ===
% Дослідження процесу диференціювання ЕКГ з шумом (файл ecg117.dat)
% N = 1
fs = 1000;
ecg = load('ecg117.dat');
ecgd1 = filter(bd1, ad1, ecg);
t = (0:length(ecg)-1)/fs; 	
figure(12)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgd1)
xlabel('time(s)');ylabel('З диференціатором 1')
xlim([1 1.5])

% N = 2
ecgd2 = filter(bd2, ad2, ecg);
t = (0:length(ecg)-1)/fs; 	
figure(13)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgd2)
xlabel('time(s)');ylabel('З диференціатором 2')
xlim([1 1.5])