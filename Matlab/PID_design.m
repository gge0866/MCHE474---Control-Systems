clc
clear

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
% figure(2)
% step(sys_CL,5)
% 
% % We can now find our other gains using the table
% 
% Kp = 0.6*KU;
% KI = 1.2*KU/PU;
% KD = 0.6*KU*PU/8;
% 
% sys_CL = (10*(KD*s^2+Kp*s+KI))/(s^2*(s+10)*(s+7.5)+10*(KD*s^2+Kp*s+KI));
% 
% figure(3)
% step(sys_CL,5)
% 
% % We also need to plot the disturbance step response
% % Use TF for Y/Td
%
% sys_dist = 10*s/(s^2*(s+10)*(s+7.5)+10*(KD*s^2+Kp*s+KI));
% 
% figure(4)
% step(sys_dist,5)


% Solution for problem DP7.7

% Set up root locus for changes in Kp and KI to see how changing each
%   changes the pole locations and response characteristics

% Root locus for Kp

s=tf('s');

KI=1;
sys_Kp = s/(s*(s+1)*(0.5*s+1)+KI);
% sys_Kp = s/(s*(s+1)*(0.5*s+1));

figure(1)
rlocus(sys_Kp)

% Root locus for KI

Kp=1;
% sys_KI = 1/(s*(s+1)*(0.5*s+1));
sys_KI = 1/(s*(s+1)*(0.5*s+1)+Kp*s);

figure(2)
rlocus(sys_KI)

% Velocity error constant for this system
% Kv=lim s->0 sGc(s)Gp(s)
Kv = KI

% We can check the response characteristics on the step response

sys_CL = (Kp*s + KI)/(s*(s+1)*(0.5*s+1)+Kp*s+KI);

figure(3)
step(sys_CL,10)