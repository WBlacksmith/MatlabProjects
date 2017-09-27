function lab01_main
%=== Дисципліна:Основи обробки біомедичної інформації ===
%--- Лабораторна робота #1 Моделювання дискретних сигналів ---
%
% Використовуйте файли даних: 
% pec1.dat - сигнал ФКГ, ЕКГ та каротидного пульсу
%
% Функції користувача (m-файли), які необхідно розробити:
% pks = pksdetect(х) - знаходження піків в дискретному сигналі
%--------------------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #1')
disp('Моделювання дискретних сигналів')
disp('Виконав: , група ... ІІДС') 

%=== Завдання #1.1 ===
% Моделювання одиничного імпульсу
N = 10;
d = 2; %Затримка
n = 0:N-1;
x = double(n == 0);
y = x;
y2 = x-d;
figure(1)
subplot(2,1,1), stem(n,y)
subplot(2,1,2), stem(n,y2)

%=== Завдання #1.2 === 
% Моделювання дискретного сигналу
N = 200;
n = 0:N;
x = cos(pi*n/16);
figure(2)
subplot(3,1,1), stem(n,x)
subplot(3,1,2), plot(n,x)
subplot(3,1,3), stairs(n,x)

%=== Завдання #1.3 ===
% Моделювання дискретної експоненти
n = 0:20;
x1 = 0.8.^n;
x2 = -0.8.^n;
x3 = 1.1.^n;
x4 = -1.1.^n;
figure(3)
subplot(2,2,1), stem(n,x1)
subplot(2,2,2), stem(n,x2)
subplot(2,2,3), stem(n,x3)
subplot(2,2,4), stem(n,x4)


%=== Завдання #1.4 -1.6  ===
% Знаходження піків сигналу
fs = 1e3;
t = 0:1/fs:2;
x = 3*sin(6*pi*t) + sin(16*pi*t);
pks = find(diff(diff(x) > 0) < 0);
u = find(x(pks+1) > x(pks));
pks(u) = pks(u)+1;
plot(t,x,'k-');hold on;
plot(t(pks),x(pks),'k*');hold off;
xlabel('time(s)');ylabel('x(t)')

%за такого коду графік також будується, але програма не розуміє, де брати pks:
fs = 1e3;
t = 0:1/fs:2;
x = 3*sin(6*pi*t) + sin(16*pi*t);
pksdetect(x)
plot(t,x,'k-');hold on;
plot(t(pks),x(pks),'k*');hold off;
xlabel('time(s)');ylabel('x(t)')


%=== Завдання #2.1 - 2.2 ===
% Моделювання стохастичного сигналу
fs = 200; 
mu = 0;
sigma = 1;
T = 0.1; % за умови 20ПnТ = 2Пn, з теоретичних відомостей
D = 0.25;
n = 0:1000;%можливо n = 0:D:fs; оскільки звідки в завданні з`явилась 1000 незрозуміло
r = randn(size(n))*sigma + mu;    					% шум
s = 1.8*cos(20*pi*n*T);        				% сигнал
x = r + s;                     % сигнал+шум
fprintf('mu(r)=%4.3g\n', mean(r));
fprintf('D(r)=%4.3g\n', var(r));
fprintf('mu(x(n))=%4.3g\n', mean(x));
fprintf('D(x(n))=%4.3g\n', var(x));
fprintf('mu(s(t))=%4.3g\n', mean(s));
fprintf('D(s(t))=%4.3g\n', var(s));
plot(n,x);

%=== Завдання #3.1 ===
% Зчитування відліків біосигналів з файлу pec1.dat 
% та побудова графіків сигналів
pec1 = load('pec1.dat');
fs = 1000;
fcg = pec1(:,1); 
ecg = pec1(:,2); 
cps = pec1(:,3);
t = (0:length(fcg)-1)/fs;
subplot(3,1,1), plot(t,fcg)
xlabel('time(s)');ylabel('Фонокардіограма')
xlim([1 4])
subplot(3,1,2), plot(t,ecg)
xlabel('time(s)');ylabel('Електрокардіограма')
xlim([1 4])
subplot(3,1,3), plot(t,cps)
xlabel('time(s)');ylabel('Сигнал каротидного пульсу')
xlim([1 4])


