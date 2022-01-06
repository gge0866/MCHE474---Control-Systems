clc
clear

% The effects of damping on a mass-spring-damper system fixed to a wall

% The equation of motion of this system is:
% m*x'' + c*x' + k*x = 0

% This can be rearranged to be:
% x'' + 2*zeta*w_n*x' + w_n^2*x = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Underdamped
% Define system parameters

zeta = 0.1; % damping ratio
w_n = 2*pi; % natural frequency (rad/sec)

% Define the state-space model
A = [0 1; -w_n^2 -2*zeta*w_n];
B = []; % there is no forcing term
C = [1 0];
D = []; % there is no forcing term

sys = ss(A,B,C,D);

x0 = [1,0];

initial(sys,x0,5);