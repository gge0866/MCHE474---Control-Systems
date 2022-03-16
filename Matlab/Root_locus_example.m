clc
clear

% TF of the block diagram in Figure 7.10

% T(s) = Y(s)/R(s) = [K(s+1)(s+3)]/[s(s+2)(s+3)+K(s+1)]

% Manipulate the characteristic equation to make it look like 1+KGp(s)=0

% Characteristic equation:
% 1 + K[(s+1)]/[s(s+2)(s+3)]=0

% Use rlocus(sys) function to plot the root locus
% It requires that 'sys' is the part of the characteristic equation that is
% multiplied by Gp(s)

num = [1, 1];
den = [1, 5, 6, 0];

Gp=tf(num,den);

rlocus(Gp)