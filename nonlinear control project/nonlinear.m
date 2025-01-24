close all ; clear ; clc ;

%% Phase Plane of second-order discrete-time system

% Define the system matrix A
A = [0.3 -0.4;
     0.4  0.3];

% % Create a grid of initial conditions
% [x1, x2] = meshgrid(-2:0.2:2, -2:0.2:2);
% 
% % Flatten the grid for vectorized computation
% x1_flat = x1(:);
% x2_flat = x2(:);
% 
% % Compute the evolution of the system for one time step
% x_next = A * [x1_flat'; x2_flat'];
% 
% % Reshape results back to grid format
% x1_next = reshape(x_next(1, :), size(x1));
% x2_next = reshape(x_next(2, :), size(x2));
% 
% % Plot the phase plane
% figure;
% quiver(x1, x2, x1_next - x1, x2_next - x2, 'r', 'LineWidth', 1.5);
% hold on;
% 
% % Overlay trajectory examples
% for theta = 0:pi/6:2*pi
%     % Initial conditions
%     x0 = [cos(theta); sin(theta)];
%     
%     % Simulate system over time
%     num_steps = 1000; % Number of time steps
%     trajectory = zeros(2, num_steps);
%     trajectory(:, 1) = x0;
%     for k = 2:num_steps
%         trajectory(:, k) = A * trajectory(:, k-1);
%     end
%     
%     % Plot the trajectory
%     plot(trajectory(1, :), trajectory(2, :), 'b');
% end
% 
% hold off;
% grid on;
% axis equal;
% xlabel('x_1');
% ylabel('x_2');
% title('Phase Plane of the Discrete-Time System');
% legend('Vector Field', 'Trajectories', 'Location', 'Best');


%% Lyapunov Equation of DLTI system
% A = [0.3 -0.4;
%      0.4  0.3];
% X = dlyap(A, eye(2));
% disp(X);
% VecQ = [1; 0; 0; 1] ; 
% L = kron(transpose(A), transpose(A)) - eye(4);
% VecX = inv(L)*-VecQ;
% disp(VecX);


%% Nonlinear Example
% x = zeros(1, 100);
% y = zeros(1, 100); 
% 
% x0 = [0.05 -0.02 -0.03 0.04] ; 
% y0 = [-0.02 -0.03 0.05 -0.1] ;
% 
% for n=1:4
%     x(1, 1) = x0(1, n);
%     y(1, 1) = y0(1, n);
%     for i=1:99
%         x(1, i+1) = x(1, i)*x(1, i)+y(1, i)*y(1, i) ; 
%         y(1, i+1) = x(1, i)*y(1, i);
%         plot( x, y )
%     end
%     hold on;
%     grid on;
% end


%% Linear Time Varying
x = zeros(1, 100);
y=zeros(1, 100);

x0 = [-1 1 2 3] ; 
y0 = [-2 -1 1 2] ;

for n=1:4
    x(1, 1) = x0(1, n);
    y(1, 1) = y0(1, n);
    t=0;
    for i=1:50
        t = t + 0.1;
        x(1, i+1) = (0.5+(1)/(t+2))*x(1, i) ; 
        y(1, i+1) = (0.4+(1)/(t+3))*y(1, i);
    end
    plot( x, y )
    hold on;
    grid on;
end

plot(0, 0, 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Equilibrium at (0, 0)