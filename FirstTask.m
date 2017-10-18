%������������ �������, �������� ������� ��� � ��� ���������� � ����� ����
%�� ������
function [] = FirstTask(r)
fs = 200;
fprintf('fs =%4.3g\n ', fs);
fc =  20;                           % ���������� �������
fprintf('fc =%4.3g\n ', fc);
phi = 2*pi*fc/fs;
fprintf('phi =%4.3g\n ', phi);
b = [1 0 -1];                    % ��������� C� 
fprintf('chuselnyk =%4.3g\n ', b);
a = [1 -2*r*cos(phi) r^2]; 	% ���������
fprintf('znamennyk =%4.3g\n ', a);
%=== �������� #1.2 ===
% ��� �� ��� ��������� ������� 2-�� �������
figure(1)
n = 512;  % ������� �����, �� ��������������
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
% ���������� ���� �� ������ �������
x = roots(b);%nuli
fprintf('nuli =%4.3g\n ', x);
y = roots(a);%polusu
fprintf('polusy =%4.3g\n ', y);
figure(2)
zplane(x,y);
%=== �������� #1.5 ===
%�������� ������� ���������� �������
figure(3)
stepz(b, a);
end

