clc;
clear all;
close all;


fs=15;
n=0:(1/fs):29-(1/fs);
x =cos(pi*10*n);
figure;
plot(x)
axis([0 50 -1.5 1.5])
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
axis([0 50 -1.5 1.5])




%comparission
y1=fft(x);
y2=fft(x_up);

figure;
subplot(2,2,1)
plot(x)
axis([0 50 -1.5 1.5])
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
title('spectrum of x_up(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')

%--end_comparision--


%low-pass filter------

wc=(7.5/fs1)*2; %radians/sec
N1=100;
h1=fir1(N1-1,wc,'low');
den=[1];
x1=filter(h1,den,x_up);
y3=fft(x1);

n3=0:length(y3)-1;
k4=(fs1/length(n3))*n3;



figure;
subplot(2,1,1)
plot(x1)
title('signal after passing through low pass filter')
xlabel('time sample')
ylabel('amplitude')
xlim([50 150])
subplot(2,1,2)
plot(k4,abs(y3))
title('spectrum after low pass filter')
xlabel('frequency (Hz)')
ylabel('amplitude')
ylim([0 300])



%--Q3_c_------

h1;
x_up;
f1=conv(h1,x_up);
f2=fft(f1);
n3=0:length(f2)-1;
N2=length(f2);
Y_sig=(fs1/N2).*(-N2/2:N2/2-1);

figure;
plot(Y_sig,abs(fftshift(f2)))
title('without filter command')
xlabel('frequency (Hz)')
ylabel('amplitude')







