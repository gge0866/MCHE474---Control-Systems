clc
clear

% I*th_dd+m*g*l/2*th=f*l

m = 1; %kg
l = 2; %m
I = 1/3*m*l^2;
g = 9.8; %m/s^2

A = [0 1;
     -m*g*l/(2*I) 0];
 
B = [0; l/I];
 
C = [1 0;
      0 1];
  
D = [0;
     0];

 
time = 0:0.05:5; 
sys = ss(A,B,C,D);
[xout, t] = step(sys,time);

% Plot the angular position and angular velocity from the step input
figure(1)
plot(t,xout(:,1),'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Position Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angle (rad)','FontSize',22)

figure(2)
plot(t,xout(:,2),'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Velocity Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angular Vel. (rad/s)','FontSize',22)

x0 = [1,1];

[output_initial, t, states]=initial(sys,x0,time);

% Plot the angular position and angular velocity from the initial
% conditions
figure(3)
plot(t,output_initial(:,1),'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Position Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angle (rad)','FontSize',22)

figure(4)
plot(t,output_initial(:,2),'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Velocity Response')
xlabel('Time (s)','FontSize',22)
ylabel('Angular Vel. (rad/s)','FontSize',22)