function lab01_main
%=== ���������:������ ������� ��������� ���������� ===
%--- ����������� ������ #1 ����������� ���������� ������� ---
%
% �������������� ����� �����: 
% pec1.dat - ������ ���, ��� �� ����������� ������
%
% ������� ����������� (m-�����), �� ��������� ���������:
% pks = pksdetect(�) - ����������� ��� � ����������� ������
%--------------------------------------------------------------------

clear, clc, close all
disp('����������� ������ #1')
disp('����������� ���������� �������')
disp('�������: , ����� ... ����') 

%=== �������� #1.1 ===
% ����������� ���������� ��������
N = 10;
d = 2; %��������
n = 0:N-1;
x = double(n == 0);
y = x;
y2 = x-d;
figure(1)
subplot(2,1,1), stem(n,y)
subplot(2,1,2), stem(n,y2)

%=== �������� #1.2 === 
% ����������� ����������� �������
N = 200;
n = 0:N;
x = cos(pi*n/16);
figure(2)
subplot(3,1,1), stem(n,x)
subplot(3,1,2), plot(n,x)
subplot(3,1,3), stairs(n,x)

%=== �������� #1.3 ===
% ����������� ��������� ����������
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


%=== �������� #1.4 -1.6  ===
% ����������� ��� �������
fs = 1e3;
t = 0:1/fs:2;
x = 3*sin(6*pi*t) + sin(16*pi*t);
pks = find(diff(diff(x) > 0) < 0);
u = find(x(pks+1) > x(pks));
pks(u) = pks(u)+1;
plot(t,x,'k-');hold on;
plot(t(pks),x(pks),'k*');hold off;
xlabel('time(s)');ylabel('x(t)')

%�� ������ ���� ������ ����� ��������, ��� �������� �� ����쳺, �� ����� pks:
fs = 1e3;
t = 0:1/fs:2;
x = 3*sin(6*pi*t) + sin(16*pi*t);
pksdetect(x)
plot(t,x,'k-');hold on;
plot(t(pks),x(pks),'k*');hold off;
xlabel('time(s)');ylabel('x(t)')


%=== �������� #2.1 - 2.2 ===
% ����������� ������������� �������
fs = 200; 
mu = 0;
sigma = 1;
T = 0.1; % �� ����� 20�n� = 2�n, � ����������� ���������
D = 0.25;
n = 0:1000;%������� n = 0:D:fs; ������� ����� � ������� �`������� 1000 ����������
r = randn(size(n))*sigma + mu;    					% ���
s = 1.8*cos(20*pi*n*T);        				% ������
x = r + s;                     % ������+���
fprintf('mu(r)=%4.3g\n', mean(r));
fprintf('D(r)=%4.3g\n', var(r));
fprintf('mu(x(n))=%4.3g\n', mean(x));
fprintf('D(x(n))=%4.3g\n', var(x));
fprintf('mu(s(t))=%4.3g\n', mean(s));
fprintf('D(s(t))=%4.3g\n', var(s));
plot(n,x);

%=== �������� #3.1 ===
% ���������� ����� ��������� � ����� pec1.dat 
% �� �������� ������� �������
pec1 = load('pec1.dat');
fs = 1000;
fcg = pec1(:,1); 
ecg = pec1(:,2); 
cps = pec1(:,3);
t = (0:length(fcg)-1)/fs;
subplot(3,1,1), plot(t,fcg)
xlabel('time(s)');ylabel('��������������')
xlim([1 4])
subplot(3,1,2), plot(t,ecg)
xlabel('time(s)');ylabel('�����������������')
xlim([1 4])
subplot(3,1,3), plot(t,cps)
xlabel('time(s)');ylabel('������ ����������� ������')
xlim([1 4])


