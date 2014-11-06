clc, clear all, close all
kappa = @(d,d0) d0./d;
d=1;
d0 = linspace(0,1);
kvot = @(kappa) (1+kappa.^2)/(1-kappa.^2);
y=kvot(kappa(d,d0));
plot(d0,y);