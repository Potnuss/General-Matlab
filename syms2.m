%%
close all, clc, clear all
format long
syms win wut u1 u2 kvot
syms z1 z2 z3 z4 z5 z6 z7

f = sym('(win-u2*win)/(wut-u2*win)');

win = solve(f == u1, win);

kvot= win/wut;
pretty(simplify(kvot))
kvot = subs(kvot,[u1 u2],[(z1*z4)/(z2*z3) -z5/(z7-z5)]);
pretty(simplify(kvot))
kvot = subs(kvot,[z1 z2 z3 z4 z5 z6 z7],[35 11 28 18 26 20 -66]);
pretty(simplify(kvot))
double(kvot)
%%
