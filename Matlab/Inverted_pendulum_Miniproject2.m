clc
clear

% Define gravitational constant and length of the pendulum
g = 9.8; % m/s^2
l = 2; % length of the pendulum in meters

% Define the open-loop linear system in state-space form (state-variable
% representation)

% x_dot = Ax + Bu
% y = Cx + Du

A = [0 1;
     g/l 0];
 
B = [0; 
     -1/l];
 
C = [1 0];
  
D = [0];

sys_lin = ss(A,B,C,D); % state-space for open-loop linearized system

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% You only need to change things here %%%%%%%%%%%%%%%%%%
% Design LQR

Q = [1 0;
     0 1];
 
R = [1];

%%%%%%%%%%%%%%%%%%%%% Change nothing below this line %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[K,S,e] = lqr(sys_lin,Q,R);

% Redefine the closed-loop system as x_dot = (A-BK)x

A_lqr = A-B*K;
B_lqr = [0;
         0];

sys_lqr = ss(A_lqr, B_lqr,C,D);

% time array to be used for simulating the initial condition response
time = 0:0.01:5;

% initial condition response
x0=[0,10]; % initial velocity is equivalent to someone kicking the system
[output_lin, t, states_lin] = initial(sys_lqr,x0,time);

% Plot the angular position and angular velocity from the initial condition
figure(1)
plot(t,output_lin,'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Linear Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angle (rad)','FontSize',22)

% Simulation of nonlinear inverted pendulum

[t,th]=ode45(@(t,th) invert_pend(t,th,g,l,K), [0,5], x0);

figure(2)
plot(t,th(:,1),'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Nonlinear Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angle (rad)','FontSize',22)
