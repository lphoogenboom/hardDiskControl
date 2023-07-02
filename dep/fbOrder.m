clear;clc;

syms z w s;

tel = 2*z*w*s+w^2;
noem = s^2*(s^2+2*z*w*s+w^2);

P = tel/noem

G = P/(1+P);

G  = subs(G,[z, w],[0.1, 1000])