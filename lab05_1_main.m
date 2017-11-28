function lab05_main
%=== ���������: ������ ������� ��������� ���������� ===
%--- ����������� ������ #5 ������ֲ���� ���˲� ��������˲�
%
% �������������� ����� �����: 
%   eeg1-c3.dat - ������ ���, fs = 100 ��
%   eeg1-f3.dat - ������ ���, fs = 100 ��
%   eeg1-f4.dat - ������ ���, fs = 100 ��
%   eeg1-p3.dat - ������ ���, fs = 100 ��
%   eeg1-p4.dat - ������ ���, fs = 100 ��
%   eeg1-o2.dat - ������ ���, fs = 100 ��
%----------------------------------------------------------

clear, clc, close all
disp('����������� ������ #5')
disp('������ֲ���� ���˲� ��������˲�')
disp('�������: ��������� �.�.  , ����� �� - 461 �Ͳ���')

%=== �������� #1.1 ===
% ����������� ������������� ����������� �������
fs = 200; 
f0 = 5; 
A = 0.5; 
D = 0.25; 
N = 400; 
t = (0:(N-1))/fs;		% ������ ���� 
s = A*cos(2*pi*f0*t); 
v = 2*rand(size(t))*D ;
x = s + v;
% ������� ��������� �������
figure(1)
subplot(3,1,1), plot(s),grid on
xlabel('s(n)');ylabel(' ')
subplot(3,1,2), plot(v),grid on
xlabel('v(n)');ylabel(' ')
subplot(3,1,3), plot(x),grid on
xlabel('x(n)');ylabel(' ')

%=== �������� #1.2 ===
% ���������� ������ ������� ����, ������� ������� �� ��������� ���/������
Ds = var(s);
fprintf('�������� ������� =%4.3g\n', Ds);
Dv = var(v);
fprintf('�������� ���� =%4.3g\n', Dv);
Vid = 10*log10(Dv/Ds);
fprintf('³�������� ������� �� ����,�� =%4.3g\n',Vid);

%=== �������� #1.3 ===
% ���������� �������� ������ ��� �������������� �������  
maxlag = fix(-200:200);
[r, lags]=xcorr(x, 'unbiased');
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (2)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== �������� #1.4 ===
% ���������� ������ ������ ��� �������������� �������  
maxlag = fix(-300:300);
[r, lags]=xcorr(x, 'biased');
r = r(maxlag<0);
lags = lags(maxlag>0);
figure(3)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== �������� #2.1 ===
% ������������ ������� ��� ���� (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.txt');% ������ ���
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs; 
figure(4)
plot(t,eeg)
xlabel('time(s)');ylabel('��� �������')
xlim([1 1.5])

%=== �������� #2.2 ===
% �������� ����� ������� ��� �� t1 = 4,7 � �� t2 = 5,8 �
t1 = 4.7;
t2 = 5.8;
figure(5)
plot(t,eeg)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])

%=== �������� #2.3 ===
% ���������� �������� ������ ��� ������� ���
maxlag = fix(-200:200);
[r, lags]=xcorr(eeg, 'unbiased');
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (6)
plot(lags/fs,r)
xlabel('Lag (s)')
%=== �������� #2.4 ===
% ���������� ���������� ������ �� �������� �������
 
%=== �������� #2.5 ===
% ���������� ����������� �������� �������
Sxx = abs(fft(eeg))/length(eeg);
Sxx = [Sxx(1);2*Sxx(2 : end - 1);Sxx(end)];
N = length(Sxx);
f = (0:(N-1))/N*fs;
figure (7)
plot(f,Sxx)
xlabel('');ylabel('')

%=== �������� #2.6 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
fs = 100;
eeg = load('eeg1-c3.txt');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs; 
figure(7)
plot(t,eeg)
xlabel('time(s)');ylabel('��� �������')
xlim([1 1.5])

% �������� ����� ������� ��� �� t1 = 4,2 � �� t2 = 4,96 �
t1 = 4.2; 
t2 = 4.96;
T_Two(t,t1,t2,eeg,fs)

% ���������� �������� ������ ��� ������� ���
...

% ���������� ���������� ������ �� �������� �������

% ���������� ����������� �������� �������
...

%=== �������� #3.1 ===
% ������������ ������� ��� ���� (eeg1-o2.dat)
fs = 100;
eeg1 = load('eeg1-o2.txt');
eeg1 = detrend(eeg1);
t = (0:length(eeg1)-1)/fs; 
figure(8)
plot(t,eeg1)
% ������������ ������� ��� ���� (eeg1-c3.dat)
eeg2 = load('eeg1-c3.txt');
eeg2 = detrend(eeg2);
figure(9)
plot(t,eeg2)
%=== �������� #3.2 ===
% �������� ����� ������� ��� �� t1 = 5,71 � �� t2 = 6,78 �
t1 = 5.8;
t2 = 6.7;
figure(10)
subplot(2,1,1), plot(t,eeg1)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])
subplot(2,1,2), plot(t,eeg2)
xlabel('time(s)');ylabel('  ')
xlim([t1 t2])

%=== �������� #3.3 ===
% ���������� ��� ������� ���
maxlag = fix(-200:200);
[r, lags]=xcorr(eeg1, eeg2);
r = r(maxlag<0);
lags = lags(maxlag>0);

figure (11)
plot(lags/fs,r)
xlabel('Lag (s)')

%=== �������� #3.4 ===
% ���������� ������ ����������� �������� ������� ���
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

%=== �������� #3.5 ===
% ������������ ������� ��� ���� (eeg1-p3.dat)
eeg1 = load('eeg1-p3.txt');
% ������������ ������� ��� ���� (eeg1-p4.dat)
eeg2 = load('eeg1-p4.txt');
t1 = 4.8;
t2 = 5.7;
T_Three(t1,t2,eeg1,eeg2)
%=== �������� #3.6 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
eeg1 = load('eeg2-f3.txt');
% ������������ ������� ��� ���� (eeg1-f4.dat)
eeg2 = load('eeg1-f4.txt');
t1 = 4.2;
t2 = 4.9;
T_Three(t1,t2,eeg1,eeg2)

