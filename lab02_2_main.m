function lab02_main
%=== ���������: ������ ������� ��������� ���������� ===
%--- ����������� ������ #2 Բ�����ֲ� ��������˲� Բ������� � Ѳ�
%
% �������������� ����� �����: 
% ecg117.dat - ������ E�� 
% ecg_2�60.dat - ������ ��� � ��������� ���������� �������� 60 ��
%----------------------------------------------------------

clear, clc, close all
disp('����������� ������ #2')
disp('Բ�����ֲ� ��������˲� Բ������� � Ѳ�')
disp('�������: ..., ����� ... ����')

%=== �������� #1.1 ===
% ��������� ������� �������, ���������� ��� �� ���
fs = 1000;
b =	[1 2 1];	% ����������� ���������� ������� 
a = 1;
n = 512;	% ������� �����, �� ��������������
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
%����� ��������� ������� ���� = 490��
%=== �������� #1.2 ===
% ���������� ���� �������
% � ���������� ������� ������� ������ �������� ������������ �������
% H(z)= 1/4[1+2(z^(-1))+z^(-2)]
% ����������� �� ��`����� ������� �������� �����. ������� �
% ���������� ������: H(z)=(z^2 + 2z +1)/(4(z^2))
% ��� ������ ��� ������� ���������� �� ���� ����� � ����������
% ������������ ������� � ��������� �����
disp('��� ������� �������') 
p = [1 2 1];
x = roots(p);
% x1 = -1, x2 = 1.
%=== �������� #1.3 ===
% Գ�������� ���, ���� ecg117.dat
fs = 1000;
b =	[1 2 1];	% ����������� ���������� ������� 
a = 1;
ecg = load('ecg117.dat');	% ������ ���
ecg = detrend(ecg);
ecgf = filter(b,a,ecg);
t = (0:length(ecg)-1)/fs; 
figure(2)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('��� ������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf)
xlabel('time(s)');ylabel('� �������� �������')
xlim([1 1.5])

%=== �������� #2.1 ===
%��������� ������� ������������� ������������
fs = 1000;
bp = [-3 12 17 12 -3];		% ����������� ���������� �������
ap = 1;
n =  5;% ������� �����, �� ��������������
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
% ���������� ���� �������
xb = roots(bp);
yb = roots(ap);
% ����� ���� �� ������ �������
figure(4)
zplane(xb,yb);
%=== �������� #2.2 ===
%Գ�������� ��� ���� ecg117.dat � ������������� ������� 
%������������� ������������
ecg = load('ecg117.dat');	% ������ ���
ecg = detrend(ecg);
ecgf5 = filter(bp,ap,ecg);
t = (0:length(ecg)-1)/fs; 
figure(5)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('��� ������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf5)
xlabel('time(s)');ylabel('� ������������ ��������')
xlim([1 1.5])

%=== �������� #2.3 ===
%��������� ������������ ������������ ������� �������� ������� 
%� ������������ ��������
figure(6)
subplot(2,1,1), plot(t,ecgf)
xlabel('time(s)');ylabel('� �������� �������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgf5)
xlabel('time(s)');ylabel('� ������������ ��������')
xlim([1 1.5])

%=== �������� #3.1 ===
% ���������� ������������ �������� ������������ �������
br =  [1 0.618 1];  % ����������� ���������� ������� 
ar = 1;
n =  3;	% ������� �����, �� ��������������
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
% ���������� ���� �������
xr = roots(br);
yr = roots(ar);
% ����� ���� �� ������ �������
figure(8)
zplane(xr,yr);
% �������� ������������ �������
H = filt (br, ar)
%=== �������� #3.2 ===
% Գ�������� ������� ��� (���� ecg2�60.dat) ����������� ��������
fs = 250;
ecg = load('ecg2x60.dat');		% ������ ���
ecg = detrend(ecg);
ecgrf = filter(br,ar,ecg);
t = (0:length(ecg)-1)/fs; 	
figure(9)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('��� ������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgrf)
xlabel('time(s)');ylabel('� ����������� ��������')
xlim([1 1.5])

%=== �������� #4.1 ===
% ���������� ������������ ��������������
% N = 1
fs = 1000;
bd1 = [1 1];		% ����������� ���������� ������� 
ad1 = 1;
n = 2;		 % ������� �����, �� ��������������
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
bd2 =  [1 1];  	% ����������� ���������� ������� 
ad2 = 2;
n = 2;	  % ������� �����, �� ��������������
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

% �������� ������������� �������
H1 = filt (bd1, ad1)
H2 = filt (bd2, ad2)

%=== �������� #4.2 ===
% ���������� ������� ��������������� ��� � ����� (���� ecg117.dat)
% N = 1
fs = 1000;
ecg = load('ecg117.dat');
ecgd1 = filter(bd1, ad1, ecg);
t = (0:length(ecg)-1)/fs; 	
figure(12)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('��� ������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgd1)
xlabel('time(s)');ylabel('� ��������������� 1')
xlim([1 1.5])

% N = 2
ecgd2 = filter(bd2, ad2, ecg);
t = (0:length(ecg)-1)/fs; 	
figure(13)
subplot(2,1,1), plot(t,ecg)
xlabel('time(s)');ylabel('��� ������')
xlim([1 1.5])
subplot(2,1,2), plot(t,ecgd2)
xlabel('time(s)');ylabel('� ��������������� 2')
xlim([1 1.5])