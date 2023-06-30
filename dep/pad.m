clc; clear; clear path;
addpath ../funcs/.

z = 0.1;
w = 1000;
s = tf([1 0],[1]);
Gs = (2*z*w*s+w^2)/(s^2*(s^2+2*z*w+w^2));

Gain = 1;
P= 1;
I = 0;
D = 0;
N = 0;

Cs = pidGen(P,I,D,N,Gain);

tFuncCL = Gs*Cs/(1+Gs*Cs);

% clf;
% step(tFuncCL,10);

clf;
nyquist(Gs)