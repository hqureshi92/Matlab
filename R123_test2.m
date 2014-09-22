%R123 optimize function

function output = R123_test2(x,t)

SA    = 59.0;        %bead surface area                       [cm^2]
alpha = .0374;       %ZF/RT                                   [mV^-1]
fdelp = 36.0;        %plasma membrane potential               [mV]
fdelm = 130.0;       %mitochondrial membrane potential        [mV]
Kpgp  = 0.41e-3*SA;  %Pgp-mediated dye efflux rate            [mL/min]
V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
Ve    = 3.0;         %Extracellular medium volume             [mL]
P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
%kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
%kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
[T,Y] = ode45(@Research, t, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, x(1), x(2));

output = Y(:,1);