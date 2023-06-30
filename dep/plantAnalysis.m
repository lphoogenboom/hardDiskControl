clear; clc; clear path;
addpath ../funcs/.

zeta = 0.1;
omega = 1000;
s = tf([1 0],1);
Gs = (2*zeta*omega*s+omega^2)/(s^2*(s^2+2*zeta*omega+omega^2));


bode()