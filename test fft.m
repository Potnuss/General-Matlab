
clc, clear all, close all

s = tf ('s');
p = [0 j*[1,5,7,9] -j*[1,5,7,9]];
num =tf( poly(p), 1);
den =( (s+4)^13);
Sys = num/den; 
k=1/abs(freqresp(Sys,3));
Filter = k*Sys;

% subplot(1,3,1);
% bode(num); %
% title('bode(num)');
% grid on;
% 
% subplot(1,3,2);
% bode(Sys); %
% title('bode(sys)');
% grid on
% 
% subplot(1,3,3);
% bode(Filter); %
% grid on

 abs(freqresp(Filter,3));

%System G
G =( (s + 0.1) * (s + 10) )/ ((s+1) * (s^2 + s + 9));

%INSIGNAL X
N=8192;
Fs=100;
Tmax=N/Fs;
Ts=Tmax/(N-1);
w1=10*pi;
w2=17*pi;
%Ts=1/Fs; Varför fungerar det ej?
t = 0 : Ts : Tmax;
x1 = sin(w1*t);
x2 = sin(w2*t);
x= x1+x2;
 plot(t,x);   %udda funk.

%UTSIGNAL y
y=lsim(G,x,t);
%plot(t,y,'r');

%Filtera X och Y

% filtX= lsim(Filter,x,t);
% filtY= lsim(Filter,y,t);

% subplot(1,2,1)
% plot(t,filtX,'b')
% hold on
% plot(t,x,'m'); 
% title('x(t)');
% xlabel('t(s)');
% ylabel('Amplitud');
% legend('x(t) ursp. signal','filtx(t) signal efter filter');
% 
% 
% subplot(1,2,2)
% plot(t,y,'m');
% hold on
% plot(t,filtY,'b')
% title('y(t)');
% xlabel('t(s)');
% ylabel('Amplitud');
% legend('y(t) ursp. signal','filty(t) signal efter filter');

%FFT
k = 0:1:N-1;
Fs=1/Ts;
omegak = 2*pi*Fs*k/N;

%FFT på x
X = abs(fft(x1));
%plot(omegak,X);
title('FFT på filtrerad signal, filtx(t)');
xlabel('\omega [rad/s]');
ylabel('Amplitud');


%FFT på y
% Y = abs(fft(filtY));
% plot(omegak,Y);
% title('FFT på filtrerad signal, filty(t)');
% xlabel('\omega [rad/s]');
% ylabel('Amplitud');
