clear; clc;
% M_p = e^(-frac(pi * xi,sqrt(1-xi^2)))
xi = 0.690108;
M_p = exp(-(pi * xi) / (sqrt(1-xi^2)) )*100

syms xi

damp = exp(-(pi * xi) / (sqrt(1-xi^2)) )*100-4.99;
x = double(solve(damp,xi))
