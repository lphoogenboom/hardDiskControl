clear; clear path; clc;
cd('~/git/hardDiskControl/continuousTimeControl/distReject/')
load('../../data/plantTF.mat');
addpath ../../funcs/;
format shortG

%% Reference Trakcing

[A,B,C,D]=tf2ss([200 10^6],[1 200 10^6 0 0]);
sys = ss(A,B,C,D);
riseTime = 0.052333; %seconds
dsys = c2d(sys,riseTime/10);
Gz = tf(dsys);

P = 10;
I = 0;
D = 50;
N = 150;
Cs = pidGen(P,I,D,N,1);
Cz = c2d(Cs,riseTime/10);

figure('Position',[0 0 1000 1000]);clf; hold on;
step(Gz*Cz/(1+Gz*Cz)); grid on;

%% Disturbance Rejection
close all;
riseTime = 0.07; %seconds
dsys = c2d(sys,riseTime/10);
Gz = tf(dsys);

P = 1100;
I = 1200;
D = 40;
N = 120;
Cs = pidGen(P,I,D,N,1);
Cz = c2d(Cs,riseTime/10);

figure('Position',[0 0 1000 1000]);clf; hold on;
step(Gz/(1+Gz*Cz)); grid on;
