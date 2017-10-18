%Синтезування фільтра, побудова графіків АЧХ і ФЧХ обчислення і карта нулів
%та полюсів
function [] = FirstTask(r)
fs = 200;
fprintf('fs =%4.3g\n ', fs);
fc =  20;                           % центральна частота
fprintf('fc =%4.3g\n ', fc);
phi = 2*pi*fc/fs;
fprintf('phi =%4.3g\n ', phi);
b = [1 0 -1];                    % чисельник CФ 
fprintf('chuselnyk =%4.3g\n ', b);
a = [1 -2*r*cos(phi) r^2]; 	% знаменник
fprintf('znamennyk =%4.3g\n ', a);
%=== Завдання #1.2 ===
% АЧХ та ФЧХ смугового фільтру 2-го порядку
figure(1)
n = 512;  % кількість точок, що розраховуються
[h,w] = freqz(b,a,n);
mag = abs(h);
phase = angle(h)*180/pi;
figure(1)
subplot(2,1,1), plot(w/(2*pi)*fs,mag),grid on
xlabel('Hz');ylabel('dB')
xlim([0 100])
subplot(2,1,2), plot(w/(2*pi)*fs,unwrap(phase)),grid on
xlabel('Hz');ylabel('phase')
xlim([0 100])
% Обчислення нулів та полюсів фільтру
x = roots(b);%nuli
fprintf('nuli =%4.3g\n ', x);
y = roots(a);%polusu
fprintf('polusy =%4.3g\n ', y);
figure(2)
zplane(x,y);
%=== Завдання #1.5 ===
%Побудува графіків перехідних процесів
figure(3)
stepz(b, a);
end

