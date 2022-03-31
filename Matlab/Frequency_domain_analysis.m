clc
clear



% CP8.5
% The closed-loop transfer function for the system is:
% T(s)=100/(s(s+6)+100)

% Get the bode plot of the closed-loop system
s=tf('s');

sys=100/(s*(s+6)+100);

w1=0.1;
w2=1000;

w=logspace(w1,w2);

bode(sys);

% Calculate the resonant frequency and resonant peak from the plot
dbgain=4.85;
wr=9.06;

Mpw=db2mag(dbgain)

% % Problem DP8.1
% 
% s=tf('s');
% 
% % (a) Open-loop frequency response
% K=1;
% sys_ol=K*(s+2)/(s^2*(s+12));
% figure(1)
% bode(sys_ol);
% 
% % (b) Closed-loop frequency response
% sys_cl=(K*(s+2))/(s^2*(s+12)+K*(s+2));
% figure(2)
% bode(sys_cl);
% 
% 
% % (c) Open-loop frequency response
% K=50;
% sys_ol=K*(s+2)/(s^2*(s+12));
% figure(3)
% bode(sys_ol);
% 
% % Closed-loop frequency response
% sys_cl=(K*(s+2))/(s^2*(s+12)+K*(s+2));
% figure(4)
% bode(sys_cl);
% 
% % (d)