close all ; clear ; clc ; 

[A, B, C, D] = linearize() ; 

tspan = [0 20];
x0 = [pi/10 200];
[t,x] = ode45(@(t,x) odefcn(t,x), tspan, x0);
plot(t,x(:,1),'linewidth', 1.5) ; 






















% t = 0:0.001:5-0.001 ; 
% alphap1 = (pi/100) * ones(1, length(t)/2) ; 
% alphap2 = (pi/9) * ones(1, length(t)/2) ; 
% alphat = [alphap1 alphap2] ; 
% T = 4000000 * ones(1, length(t)) ; 
% 
% u = [alphat ; T] ; 
% x0 = [0 ; 400] ; 
% 
% [y, x] = nonlinear_sim(transpose(u), transpose(t), x0) ; 
% 
% sys = ss(A, B, C, D) ; 
% [Y, Tout, X] = lsim(sys, u, t, x0) ; 
% 
% plot(t, y) ; 
% hold on ; 
% plot(t, Y) ; 

