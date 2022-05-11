clc
clear

% Plot poles and zeros for a mass-spring-damper system with a seismic input

% The transfer function for the system is:
% X(s)/F(s) = (2*zeta*w_n*s + w_n^2)/(s^2 + 2*zeta*w_n*s + w_n^2)

% Define the system parameters that will be used for evaluation
m = 1; % mass (kg)
zeta = 0.1; % damping ratio
w_n = 2*pi; % natural frequency (rad/sec)

% Define the numerator and denominator of the transfer function
num = [2*zeta*w_n w_n^2];
den = [1 2*zeta*w_n w_n^2];

% Now define the transfer function by passing `num` and `den` to the tf()
% function
sys = tf(num,den);

% The poles and zeros for this can be plotted using the pzmap() function
figure(1)
pzplot(sys)
ax=gca;
ax.FontSize=16;
xlabel('Real Axis','FontSize',22)
ylabel('Imag. Axis','FontSize',22)
% Best (only?) way to change marker size for pzmap()
hm = findobj(gca, 'Type', 'Line');          % Handle To 'Line' Objects
hm(2).MarkerSize = 10;                      % ?Zero? Marker
hm(3).MarkerSize = 10;                      % ?Pole? Marker
grid off

% Now let's plot the time response to a step input (or step response)

time = 0:0.05:5; % time samples (initial_time:time_spacing:final_time

[xout, t] = step(sys,time);

figure(2)
plot(t,xout,'red','LineWidth',2)
ax=gca;
ax.FontSize=16;
grid on
box off
title('Step Response')
xlabel('Time (s)','FontSize',22)
ylabel('Position (m)','FontSize',22)