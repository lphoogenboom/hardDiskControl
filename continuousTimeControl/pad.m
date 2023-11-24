clear; clear path; clc; close all;
cd('~/git/hardDiskControl/continuousTimeControl/distReject/')
load('../../data/plantTF.mat');
addpath ../../funcs/;
format shortG

P = 10;
I = 0;
D = 40;
N = 150;
Cs1 = pidGen(P,I,D,N,1);

P = 10;
I = 0;
D = 50;
N = 100;
Cs2 = pidGen(P,I,D,N,1);

P = 10;
I = 0;
D = 40;
N = 120;
Cs3 = pidGen(P,I,D,N,1);

P = 10;
I = 0;
D = 50;
N = 120;
Cs4 = pidGen(P,I,D,N,1);

% figure('Position',[100 100 1000 1000]);clf; hold on;
% margin(tf(50,1))
% margin(tf(20,[1 0]))
% margin(Cs1);
% margin(Cs2);grid on;
% legend("P-Controller","I-Controller","D-Controller","PD-Controller")

% figure('Position',[100 100 1000 1000]);clf; hold on;
% margin(Ps/(1+Ps));
% margin(Cs2*Ps);grid on;
% legend("P=800,,D=50,N=150","P=1100,I=1200,D=40,N=120")

figure('Position',[100 100 1000 1000]); clf; hold on;
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response')
[y,t] = step(Ps*Cs1/(1+Cs1*Ps),0.4);
plot([t],[y],'b','LineWidth',1.2)
[y,t] = step(Ps*Cs3/(1+Cs2*Ps),0.4);grid on;
plot(t,y,'r','LineWidth',1.2)
[y,t] = step(Ps*Cs3/(1+Cs3*Ps),0.4);grid on;
plot(t,y,'r','LineWidth',1.2)
[y,t] = step(Ps*Cs4/(1+Cs4*Ps),0.4);grid on;
plot(t,y,'r','LineWidth',1.2)

% plot([0 100],[1.05 1.05],'-.')
% plot([0 100],[1.01 1.01],'k--')
% plot([0 100],[.99 .99],'k--')
% axis([0 t(end) 0 1.1])
% legend("P=800,,D=50,N=150","P=1100,I=1200,D=40,N=120", 'Max Overshoot', 'Settling Margin',"Location",'southeast')
grid on;

cd ../../graphics/

