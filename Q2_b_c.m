clc;
close all;
clear all;

fs=40;
n=0:(1/fs):29-(1/fs);
x =cos(pi*10*n)+ cos(pi*20*n)+cos(pi*30*n);


%lowpass filter

wc=(5/fs)*2; %radians/sec
N1=100;
h1=fir1(N1-1,wc,'low');
den=[1];
x1=filter(h1,den,x);

figure;
subplot(2,1,1)
plot(x)
title('given signal x')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 4])

subplot(2,1,2)
plot(x1)
title('signal x after passing though low pass filter')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 4])


% y1=fft(x1);
% 
% n1=0:length(y1)-1;
% k1=(fs/length(y1))*n1;
% plot(k1,y1)


%--down sampling by 4---
 fs1=fs/4;
% t1=n.*(1/fs1);
% x_d =cos(pi*10*t1)+ cos(pi*20*t1)+cos(pi*30*t1);

%x_d=x1(1:4:length(x1));
x_d = downsample(x1,4);

figure;
plot(x_d)
title('down sampled signal x_d')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 2])




%comparission
y1=fft(x1);
y2=fft(x_d);

figure;
subplot(2,2,1)
plot(x1)
axis([0 50 -2 2])
title('signal after passing through low pass filer ')
xlabel('time sample')
ylabel('amplitude')

subplot(2,2,2)
plot(x_d)
title('down sampled signal x_d')
xlabel('time sample')
ylabel('amplitude')
axis([0 50 -2 2])


n1=0:length(y1)-1;
n2=0:length(y2)-1;
k1=(fs/length(n1))*n1;
k2=(fs1/length(n2))*n2;

subplot(2,2,3)
plot(k1,abs(y1))
ylim([0 2000])
title('spectrum of x(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')


subplot(2,2,4)
plot(k2,abs(y2))
%ylim([0 7000])
title('spectrum of x_d(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')

%--end_comparision--



%Q-c---

%lowpass
% h1;
% H=fft(h1);
% n2=0:length(H)-1;
% N1=length(H);
% H_k=(fs/N1).*(-N1/2:N1/2-1);
% 
% figure
% plot(H_k,abs(fftshift(H)));
% 
% y4=fft(x);
% n3=0:length(y4)-1;
% N2=length(y4);
% Y_sig=(fs/N2).*(-N2/2:N2/2-1);
% figure
% plot(Y_sig,abs(fftshift(y4)));
% 
% z1=zeros(1,1450);
% z2=zeros(1,1450);
% H=[z1 H z2];
% 
% final=abs(y4).*abs(H);
% 
% k3=0:length(final)-1;
% N4=length(k3);
% %final_x=(-N4/2:N4/2-1);
% figure;
% plot(abs(fftshift(final)))


h1;
x;
f1=conv(h1,x);
f2=fft(f1);
n3=0:length(f2)-1;
N2=length(f2);
Y_sig=(fs/N2).*(-N2/2:N2/2-1);

figure;
plot(Y_sig,abs(fftshift(f2)))
title('low pass filter in f- domain')
xlabel('frequency (Hz)')
ylabel('amplitude')





