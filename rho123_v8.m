    function dydt = rho123_v8(time, y, parameters)
% Differential equation model of cell experiments.
% y's are the chemical species, the parameter vector contains ALL the parameters ... possibly
% "fixed" and variable -- if the DE is being called as part of an optimization routine.
%
% Be sure to load the parameter vector before calling the ODE solver.
% Update:  v4: 01-17-2008, adjust the equation in order to improve running
%              speed
%          v5: 03-18-2008, using scaler
%          v6: model without unionized rhodamine123
%******************************************************************
%          v8: 04-24-2008, transport depent on electrical gradient 

C1    = y(1);            % r123 concentration in mediu (nM)
C2    = y(2);            % rh123 amount in cytoplasm
C3    = y(3);            % rh123 amount in mitochondrial matrix
C1P   = y(4);            % plastic bound conc.
% 
%
ps1         = parameters(1);   % Compartment 1 volume; volume of the surronding medium (ml)
ps2         = parameters(2);   % Compartment 2 volume (ml)
v2          = parameters(3);   % mito volume
v3          = parameters(4);
vmaxkm      = parameters(5);
delp        = parameters(6);
delm        = parameters(7);
k1b         = parameters(8);
km1         = parameters(9);
alfa        = parameters(10);   % PS for "passive" R6G movement between Compartment 1 <--> Compartment 2 (1/s)
v1          = parameters(11);


%scaler = 10; 
alfa = 0.0374158;
constp0 = exp(alfa*delp);
constp1 = ps1*alfa*delp*constp0/(constp0-1);
constp2 = ps1*alfa*delp/(constp0-1);

constm0 = exp(alfa*delm);
constm1 = ps2*alfa*delm*constm0/(constm0-1);
constm2 = ps2*alfa*delm/(constm0-1);


 a11 = -k1b - constp1/v1;
 a12 =  vmaxkm/v1 + constp2/v1;
 a13 =  0;
 a14 =  km1;
 %
 a21 =  constp1/v2;
 a22 = -vmaxkm/v2 - constp2/v2 - constm1/v2;
 a23 =  constm2/v2;
 a24 =  0;
 %
 a31 =  0;
 a32 =  constm1/v3;
 a33 = -constm2/v3;
 a34 =  0;
 %
 a41 =  k1b;
 a42 =  0;
 a43 =  0;
 a44 = -km1;

 
dC1dt   = a11*C1 + a12*C2 + a13*C3 + a14*C1P;
dC2dt   = a21*C1 + a22*C2 + a23*C3 + a24*C1P;
dC3dt   = a31*C1 + a32*C2 + a33*C3 + a34*C1P;
dC1Pdt  = a41*C1 + a42*C2 + a43*C3 + a44*C1P;

dydt = [dC1dt; dC2dt; dC3dt; dC1Pdt];