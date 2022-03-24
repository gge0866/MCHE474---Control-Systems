clc
clear

% % The code used to solve two problems is included in this script.
% % Comment out the lines for the problem that you are not currently trying
% % to solve
%
% (Hint: You can highlight groups of lines to comment/uncomment
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Solution for problem AP7.14
% % Y/R characteristic equation
% 
% s = tf('s');
% 
% 
% % Figure out what the ultimate gain is by checking when the root locus
%     % crosses the imaginary axis
% sys_CE = s/(s^2*(s+10)*(s+7.5));
% 
% figure(1)
% rlocus(sys_CE)
% 
% % The root locus crosses the imaginary axis around K=1310
% % Remember we redefined K=10*Kp
% 
% KU = 1310/10; % ultimate gain
% 
% % We can also get ultimate period from the root locus
% % The frequency at the crossing is around w=8.75 rad/s
% 
% PU = 2*pi()/8.75;
% 
% % We can confirm this with a step input and manually measure the period
% 
% sys_CL = (10*KU*s)/(s^2*(s+10)*(s+7.5)+10*KU*s);
% 
% [CL_output,time]=step(sys_CL,5);
% 
% figure(2)
% plot(time,CL_output,'red','LineWidth',2)
% grid on
% box off
% ax=gca;
% ax.FontSize=16;
% title('Ultimate Gain Response')
% xlabel('Time (s)','FontSize',22)
% ylabel('Response','FontSize',22)
% 
% % We can now find our other gains using the table
% 
% Kp = 0.6*KU;
% KI = 1.2*KU/PU;
% KD = 0.6*KU*PU/8;
% 
% sys_CL = (10*(KD*s^2+Kp*s+KI))/(s^2*(s+10)*(s+7.5)+10*(KD*s^2+Kp*s+KI));
% 
% [CL_output,time]=step(sys_CL,5);
% 
% figure(3)
% plot(time,CL_output,'red','LineWidth',2)
% grid on
% box off
% ax=gca;
% ax.FontSize=16;
% title('Step Response')
% xlabel('Time (s)','FontSize',22)
% ylabel('Response','FontSize',22)
% 
% % We also need to plot the disturbance step response
% % Use TF for Y/Td
% 
% sys_dist = 10*s/(s^2*(s+10)*(s+7.5)+10*(KD*s^2+Kp*s+KI));
% 
% [dist_output,time]=step(sys_dist,5);
% 
% figure(4)
% plot(time,dist_output,'red','LineWidth',2)
% grid on
% box off
% ax=gca;
% ax.FontSize=16;
% title('Disturbance Response')
% xlabel('Time (s)','FontSize',22)
% ylabel('Response','FontSize',22)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solution for problem DP7.7

% Set up root locus for changes in Kp and KI to see how changing each gain
    % changes the pole locations and response characteristics
    
% Use the root locus plots to understand how changing gains changes the
    % step response

% Root locus for Kp

s=tf('s');

KI=0;
sys_Kp = s/(s*(s+1)*(0.5*s+1)+KI);

figure(1)
rlocus(sys_Kp)

% Root locus for KI

Kp=0;
sys_KI = 1/(s*(s+1)*(0.5*s+1)+Kp*s);

figure(2)
rlocus(sys_KI)

% Velocity error constant for this system
% Kv=lim s->0 sGc(s)Gp(s)
Kv = KI

% We can check the response characteristics on the step response

sys_CL = (Kp*s + KI)/(s*(s+1)*(0.5*s+1)+Kp*s+KI);
[output,time]=step(sys_CL,10);

figure(3)
plot(time,output,'red','LineWidth',2)
grid on
box off
ax=gca;
ax.FontSize=16;
title('Position Response')
xlabel('Time (s)','FontSize',22)
ylabel('Position','FontSize',22)