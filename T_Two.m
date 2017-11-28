function [] = T_Two(t,t1,t2,eeg,fs)
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
end

