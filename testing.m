close all ; 
clear ; 
clc ; 

%% DC motor parameters
Ra = 1.6 ; 
Kb = 0.26 ; 
Km = 0.26 ; 
La = 0.001 ; 
Jm = 0.0002 ; 
Bm = 0.001 ; 

%% Plant transfer function
G = tf([0 0 0 Km], [La*Jm (Ra*Jm+La*Bm) (Ra*Bm+Kb*Km) 0]) ; 

%% PID Gains
Kp = 155 ; 
Ki = 200 ; 
Kd = 0.5036 ; 

%% Controller transfer function
% PID = tf([Kd Kp Ki], [0 1 0]) ;
tau = 0.0005324 ; 
PID = tf([(Kp*tau+Kd) (Kp+Ki*tau) (Ki)], [0 1 0]) ;

%% system configuration and simulation
X = feedback(series(G, PID), [1]) ; 
t = 0:0.0001:0.1 ; 
step(X, t) ; 