function dxdt = odefcn(t,x)


% Parameters of the model
ro = 1.225*0.35 ; S = 427.0 ; g = 9.81 ; m = 217000 ; CL0 = 0.05 ; 
rond = 1.0 ; AR = 10 ; ee = 0.74 ; CD0 = 0.026 ; 
k = 1 / (pi * ee * AR) ;
W = m*g ; 
% Calculating values of Coefficients of equation of v
v2_gamma = 0.5*ro*S*CL0 ;
v2alpha_gamma = 0.5*ro*S*rond ;
% Calculating values of Coefficients of equation gamma
v2_v = -0.5*ro*S*(CD0 + k*CL0*CL0) ;
v2alpha_v = -0.5*ro*S*(k*2*CL0*rond) ;
v2alpha2_v = -0.5*ro*S*(k*rond*rond) ;

alpha = pi / 10 ; 
T = 550000 ; 


dxdt = zeros(2,1);
dxdt(1) = (1/m*x(2))*(T*sin(alpha) - W*cos(x(1)) + (v2_gamma)*x(2)*x(2) + (v2alpha_gamma)*x(2)*x(2)*alpha);
dxdt(2) = (1/m)*(T*cos(alpha) - W*sin(x(1)) + (v2_v)*x(2)*x(2) + (v2alpha_v)*x(2)*x(2)*alpha + (v2alpha2_v)*x(2)*x(2)*alpha*alpha);