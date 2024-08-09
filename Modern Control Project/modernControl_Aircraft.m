close all ;
clear ; 
clc ; 
%% Parameters of the model
ro = 1.225 ; S = 845.0 ; g = 9.81 ; m = 560000 ; CL0 = -0.0025 ; 
rond = 0.13 ; AR = 5 ; ee = 0.75 ; CD0 = 0.016 ; 

k = 1 / (pi * ee * AR) ;
W = m*g ; 

%% Calculating values of Coefficients of equation of v
v2_gamma = 0.5*ro*S*CL0 ;
v2alpha_gamma = 0.5*ro*S*rond ;

%% Calculating values of Coefficients of equation gamma
v2_v = -0.5*ro*S*(CD0 + k*CL0*CL0) ;
v2alpha_v = -0.5*ro*S*(k*2*CL0*rond) ;
v2alpha2_v = -0.5*ro*S*(k*rond*rond) ;

%% Calculating an Operating Point
v = 400 ; 
gamma = 20 * (pi/180) ; 
syms T alpha ; 
eqn1 = (1/m*v)*(T*sin(alpha) - W*cos(gamma) + (v2_gamma)*v*v + (v2alpha_gamma)*v*v*alpha) == 0 ; 
eqn2 = (1/m)*(T*cos(alpha) - W*sin(gamma) + (v2_v)*v*v + (v2alpha_v)*v*v*alpha + (v2alpha2_v)*v*v*alpha*alpha) == 0 ; 
slv = solve(eqn1, eqn2) ; 
vOP = v ; 
gammaOP = gamma ; 
TOP = slv.T ; 
alphaOP = slv.alpha ; 

%% Linearizing equation (calculating jacobian matrices)
a11 = (g/vOP)*sin(gammaOP) ; 
a12 = -(TOP*sin(alphaOP))/(m*vOP*vOP) + (W*cos(gammaOP))/(m*vOP*vOP) + (v2_gamma)/(m) + (v2alpha_gamma*alphaOP)/(m) ; 
a21 = -g*cos(gammaOP) ; 
a22 = (1/m)*(v2_v*2*vOP + v2alpha_v*2*alphaOP*vOP + v2alpha2_v*2*alphaOP*alphaOP*vOP) ; 
A=[a11 a12 ; a21 a22] ; 
b11 = (TOP*cos(alphaOP))/(m*vOP) + v2alpha_gamma*vOP*vOP ; 
b12 = (sin(alphaOP))/(m*vOP) ; 
b21 = (-TOP*sin(alphaOP))/(m) + (v2alpha_v*vOP*vOP) + (v2alpha2_v*2*vOP*vOP*alphaOP) ; 
b22 = (cos(alphaOP))/(m) ; 
B = [b11 b12 ; b21 b22] ; 
C = [1 0] ;
D = [1 0] ; 











