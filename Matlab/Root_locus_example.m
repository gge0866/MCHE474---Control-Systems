clc
clear

% % TF of the block diagram in Figure 7.10
% 
% % T(s) = Y(s)/R(s) = [K(s+1)(s+3)]/[s(s+2)(s+3)+K(s+1)]
% 
% % Manipulate the characteristic equation to make it look like 1+KGp(s)=0
% 
% % Characteristic equation:
% % 1 + K[(s+1)]/[s(s+2)(s+3)]=0
% 
% % Use rlocus(sys) function to plot the root locus
% % It requires that 'sys' is the part of the characteristic equation that is
% % multiplied by Gp(s)
% 
% num = [1, 1];
% den = [1, 5, 6, 0];
% 
% Gp=tf(num,den);
% 
% rlocus(Gp)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem DP7.1

% The open-loop numerator and denominator
num = [18 8.37 0.1215];
den = [1 1.21 12.0145 0.123 0.03];

sys = tf(num,den);

figure(1)
h=rlocusplot(sys);
p=getoptions(h);
p.XLimMode={'manual'};
p.XLim={[-1 0.25]};
setoptions(h,p)
% box off
ax=gca;
ax.FontSize=16;
% xlabel('Time (s)','FontSize',22)
% ylabel('Angle (rad)','FontSize',22)