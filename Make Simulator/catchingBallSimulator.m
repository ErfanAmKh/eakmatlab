close all ; 
clear ; 
clc ;

%% Initial conditions of the system
catcher_position = [10 0] ; 
catcher_speed = 0 ; 
ball_position = [0.0 0.5] ; 
ball_speed = [0.0 0.0] ; 
%% Dynamics of the system
F = 0 ; 
delta_F = 0 ; 
m = 0.01 ; 
k = 3.2 ; 
g = 9.8 ; 
dt = 0.01 ; 
%% Software requirements
iterations_number = 200 ; 
prompt = "enter" ; 
ax_left = -catcher_position(1, 1) ; 
ax_right = catcher_position(1, 1)+2 ; 
ax_bottom = -0.1 ; 
ax_top = ball_position(1, 2)+0.2 ; 



%% PID Gains and your definition area
Kp = 30.0 ; 
Ki = 0.0 ; 
Kd = 120.0 ; 



for i = 1:iterations_number
    %% Run Simulation & providing ERROR
    catcher_x = catcher_position(1, 1) - 1 : 0.01 : catcher_position(1, 1) + 1 ; 
    catcher_y = catcher_position(1, 2) * ones(1, length(catcher_x)) ; 
    plot(catcher_x, catcher_y, 'r', 'linewidth', 6.0) ; 
    hold on ; 
    plot(ball_position(1, 1), ball_position(1, 2), 'X') ; 
    axis([ax_left ax_right ax_bottom ax_top]) ; 
    disp(catcher_position(1, 1)) ; 
%     input(prompt) ;
    pause(0.02) ; 
    hold off ; 
    error = ball_position(1, 1) - catcher_position(1, 1) ; 
    
    
    
    %% Your Code
    delta_F = 0 ; 
    
    
    
    
    
    
    
    %% System equations
    error_arr(1, i) = error ; 
    catcher_position_arr(1, i) = catcher_position(1, 1) ; 
    refrence_arr(1, i) = ball_position(1, 1) ; 
    ball_speed(1, 2) = ball_speed(1, 2) + (-g * dt) ; 
    ball_position(1, 2) = ball_position(1, 2) + (ball_speed(1, 2) * dt) ; 
%     ball_position(1, 2) = ball_position(1, 2) + (0.5 * -g * dt^2 + ball_speed(1,2) * dt) ; 
    ball_position(1, 1) = ball_position(1, 1) + (ball_speed(1,1) * dt) ; 
    if delta_F>10
        delta_F = 10 ; 
    end
    if delta_F<-10
        delta_F = -10 ; 
    end
    F = F + k * delta_F ; 
    catcher_position(1, 1) = catcher_position(1, 1) + (0.5 * (F/m) * dt^2 + catcher_speed * dt) ; 
    
    if ball_position(1, 2) <= 0 
        if catcher_position(1, 1)+1 > ball_position(1, 1) && catcher_position(1, 1)-1 < ball_position(1, 1)
            disp(" YOU WON!!!!!     :) ") ; 
        else
            disp(" YOU LOST~~~~     :( ") ; 
        end
        break ; 
    end
    
    
    
end

subplot(2, 1, 1) ; 
e_x = -10:iterations_number ; 
e_y = zeros(1, length(e_x)) ; 
plot(e_x, e_y, '--', 'linewidth', 1.8) ; 
hold on ; 
plot(error_arr, 'g', 'linewidth', 1.5) ; 
grid on ; 
title("Error - time") ; 
subplot(2, 1, 2) ; 
% p_x = -10:iterations_number ; 
% p_y = ball_position(1, 1) * ones(1, length(p_x)) ; 
plot(refrence_arr, '-.', 'linewidth', 1.8) ; 
hold on ; 
plot(catcher_position_arr, 'c', 'linewidth', 1.5) ; 
grid on ; 
title("X position - time") ; 