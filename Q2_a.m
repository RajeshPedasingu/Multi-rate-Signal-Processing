clc;
clear all;
close all;


fs=40;
n=[0:(1/fs):29-(1/fs)];

x =cos(pi*10*n)+ cos(pi*20*n)+cos(pi*30*n);
figure;
plot(x)
axis([0 50 -2 4])
title('given signal for x axis range [0 50]')
xlabel('time sample')
ylabel('amplitude')

%-- down sample by 4.

fs1=fs/4;
% t1=n.*(1/fs1);
% x_d =cos(pi*10*t1)+ cos(pi*20*t1)+cos(pi*30*t1);

x_d = downsample(x,4);
figure;
plot(x_d)
title('down sampled signal x_d')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 4])

%comparission
y1=fft(x);
y2=fft(x_d);

figure;
subplot(2,2,1)
plot(x)
axis([0 50 -2 4])
title('given signal for x axis range [0 50]')
xlabel('time sample')
ylabel('amplitude')

subplot(2,2,2)
plot(x_d)
title('down sampled signal x_d')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 4])


n1=0:length(y1)-1;
n2=0:length(y2)-1;
k1=(fs/length(n1))*n1;
k2=(fs1/length(n2))*n2;

subplot(2,2,3)
plot(k1,abs(y1))
ylim([0 1000])
title('spectrum of x(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')


subplot(2,2,4)
plot(k2,abs(y2))
ylim([0 1000])
title('spectrum of x_d(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')

%--end_comparision--
















