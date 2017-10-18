%Смугова фільтрація ЕКГ сигналів
function [] = SecondTask(r)
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
ecg = load('ecg117.txt');% сигнал ЕКГ
ecg = detrend(ecg);
ecgf = filter(b,a,ecg);
t = (0:length(ecg)-1)/fs; 
figure(1)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('Без фільру')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf)
xlabel('time(s)');ylabel('Зі смуговим фільтром')
xlim([1 1.5])
end

