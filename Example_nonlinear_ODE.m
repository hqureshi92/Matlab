%Example of a progrma that solves three coupled non-linear ODEs using the
%MATLAB function ode45 which uses the 4th order Runge-Kutta method
% the the ODEs are the for epidemic problem
clear all;
a = 0.005; % rate constant
b = 1; % rate constant
[T,Y] = ode45(@sys_ode, [0:0.1:10], [2000 1 0], [], a, b);
plot(T, Y(:,3), '-'); %, T, Y(:, 2), '-.', T, Y(:,3), '.');