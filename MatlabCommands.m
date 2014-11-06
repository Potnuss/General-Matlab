%Testscript

t = linspace(0,1000);
t = 0:2*pi/100:8*pi;
y = cos(t);
plot(t, y)

%% Matriser
syms a1 a2 a3 a4 b1 b2

% A = [a1 a2;a3 a4]
% B = [b1; b2]
A =[a1 a2]
B =[b1;b2]
A*B
%%