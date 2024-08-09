function [Y, X] = nonlinear_sim(u, t, x0)

% Parameters of the model
ro = 1.225 ; S = 845.0 ; g = 9.81 ; m = 560000 ; CL0 = -0.0025 ; 
rond = 0.13 ; AR = 5 ; ee = 0.75 ; CD0 = 0.016 ; 

k = 1 / (pi * ee * AR) ;
W = m*g ; 

% Calculating values of Coefficients of equation of x2
v2_gamma = 0.5*ro*S*CL0 ;
v2alpha_gamma = 0.5*ro*S*rond ;

% Calculating values of Coefficients of equation x1
v2_v = -0.5*ro*S*(CD0 + k*CL0*CL0) ;
v2alpha_v = -0.5*ro*S*(k*2*CL0*rond) ;
v2alpha2_v = -0.5*ro*S*(k*rond*rond) ;


X = zeros(length(t), 2) ; 
Y = zeros(length(t), 1) ; 

X(1, 1) = x0(1, 1) ; 
X(1, 2) = x0(2, 1) ; 
Y(1, 1) = X(1, 1) + u(1, 1) ;

for i = 1:length(t)-1
    X(i+1, 1) = X(i, 1) + (1/m*X(i, 2))*(u(i, 2)*sin(u(i, 1)) - W*cos(X(i, 1)) + (v2_gamma)*X(i, 2)*X(i, 2) + (v2alpha_gamma)*X(i, 2)*X(i, 2)*u(i, 1)) ; 
    X(i+1, 2) = X(i, 2) + (1/m)*(u(i, 2)*cos(u(i, 1)) - W*sin(X(i, 1)) + (v2_v)*X(i, 2)*X(i, 2) + (v2alpha_v)*X(i, 2)*X(i, 2)*u(i, 1) + (v2alpha2_v)*X(i, 2)*X(i, 2)*u(i, 1)*u(i, 1)) ; 
    Y(i+1, 1) = X(i+1, 1) + u(i+1, 1) ; 
    disp(Y(i+1, 1));
end

end