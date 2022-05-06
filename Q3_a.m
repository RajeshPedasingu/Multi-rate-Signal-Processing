clc;
clear all;
close all;



fs=15;
n=0:(1/fs):29-(1/fs);
x =cos(pi*10*n);
figure;
plot(x)
axis([0 50 -2 2])
title('given signal for x axis range [0 50]')
xlabel('time sample')
ylabel('amplitude')


%-- Up sample by 5.

fs1=fs*5;
% t1=n.*(1/fs1);
% x_up =cos(pi*10*t1);
x_up=upsample(x,5);

figure;
plot(x_up)
title('Up sampled signal x_up')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 2])




%comparission
y1=fft(x);
y2=fft(x_up);

figure;
subplot(2,2,1)
plot(x)
axis([0 50 -2 2])
title('given signal for x axis range [0 50]')
xlabel('time sample')
ylabel('amplitude')

subplot(2,2,2)
plot(x_up)
title('up sampled signal x_up')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 2])


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
title('spectrum of a x_up(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')

%--end_comparision--


