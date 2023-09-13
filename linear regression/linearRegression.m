%% 2D Linear Regression - getting data directly from user
clear ; 
close all ; 
clc ; 

%% Getting input from the user (It also can read from a file)
n = input("enter number of points: ") ; 

points = zeros(n, 2) ; 

for i = 1:n
    disp(i) ; 
    points(i, 1) = input("enter x: ") ; 
    points(i, 2) = input("enter y: ") ; 
    disp(" ") ; 
end

%% calculating needed terms
sigma_x  = 0 ; 
sigma_y  = 0 ; 
sigma_xy = 0 ; 
sigma_x2 = 0 ; 
for i = 1:n
    sigma_x  = sigma_x  + points(i, 1) ; 
    sigma_y  = sigma_y  + points(i, 2) ; 
    sigma_xy = sigma_xy + points(i, 1) * points(i, 2) ; 
    sigma_x2 = sigma_x2 + points(i, 1) * points(i, 1) ; 
end
x_avg = sigma_x / n ; 
y_avg = sigma_y / n ; 

%% calculating line parameters
slope = (sigma_xy - (sigma_x)*(y_avg)) / (sigma_x2 - (sigma_x)*(x_avg)) ;
b = y_avg - slope * x_avg ; 


%% show points and the linear estimation
plot(points(:, 1), points(:, 2), '*') ; 
hold on ; 
x = 0:0.01:10 ; 
y = slope .* x + b ; 
plot(x, y, 'linewidth', 1.8) ; 
title("linear regression") ; 