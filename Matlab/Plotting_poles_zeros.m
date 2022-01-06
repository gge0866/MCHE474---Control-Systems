clc
clear

% Plot poles and zeros for a mass-spring-damper system fixed to a wall with
    % external force input

% The transfer function for the system is:
% X(s)/F(s) = (1/m)/(s^2 + 2*zeta*w_n*s + w_n^2)

% Define the system parameters that will be used for evaluation
m = 1; % mass (kg)
zeta = 0.1; % damping ratio
w_n = 2*pi; % natural frequency (rad/sec)

% Define the numerator and denominator of the transfer function
num = [1/m];
den = [1 2*zeta*w_n w_n^2];

% Now define the transfer function by passing `num` and `den` to the tf()
% function
G = tf(num,den);
pzmap(G)
grid on