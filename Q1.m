clc
clear all
close all

fs=8000;
n=[0:3999];
t=n.*(1/fs);
x =cos(2*pi*50*t)+ cos(2*pi*500*t);


figure;
plot(t,x)
title('Original Signal')
xlabel('time sample')
ylabel('amplitude')

% y1=fft(x)
% n1=0:length(y1)-1;
% k=n1*fs/length(y1);
% figure;
% plot(k,abs(y1))



%--low pass-----
N=100;
wc=(100/fs)*2;
b1=fir1(N-1,wc,'low');
% figure;
% freqz(b1,1)
low_pass = filter(b1,1,x);

figure
plot(t,low_pass)
title('lowpass Filtered Signal')
xlabel('time sample')
ylabel('amplitude')




%---highpass----
N=100;
wc=(100/fs)*2;
b2=fir1(N,wc,'high');
% figure;
% freqz(b2,1)
high_pass = filter(b2,1,x);

figure;
plot(t,high_pass)
title('highpass Filtered Signal')
xlabel('time sample')
ylabel('amplitude')

n1=0:length(low_pass)-1;
p=fft(low_pass);
k=n1*fs/length(n1);

figure;
plot(k,abs(p))
title('spectrum of output of low passed filter ')
xlabel('frequency (Hz)')
ylabel('amplitude')



n1=0:length(high_pass)-1;
p1=fft(high_pass);
k=n1*fs/length(n1);
figure;
plot(k,abs(p1))
title('spectrum of output of high passed filter ')
xlabel('frequency (Hz)')
ylabel('amplitude')












































% 
% 
% clc;
% clear all;
% close all;
% 
% fs=8000;
% n=0:999;
% t=n*(1/fs);
% x =cos(2*pi*50*t) + cos(2*pi*500*t)
% figure;
% plot(x)
% 
% N=100;
% 
% %lowpass
% wc=(60/fs)*2;
% h=fir1(N,wc,'high')
% figure;
% plot(h)
% %freqz(h,1)
% % figure;
% % fvtool(h,1)
% 
% %y=conv(x,h);
% 
% b=filter(h,1,x)
% 
% figure;
% plot(b)
% n1=length(b)
% p=(fft(b))
% k=(fs/n1)*(0:n1-1)
% figure;
% plot(k,abs(p))

















