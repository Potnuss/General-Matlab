clear all, clc, close all
N=2^13;
w=2*pi;
t=linspace(0,10,N);
x=sin(w*t);
% plot(t,x);
tresh=0.9;
for k=1:1:N
    if(x(k)>tresh)
        x(k)=tresh;
    end
    if(x(k)<(-tresh))
        x(k)=-tresh;
    end
        
end
%  plot(t,x);
k=linspace(0,N-1,N);
X=abs(fft(x));
plot(k,X)
