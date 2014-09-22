%Parameter values are for R123  
function output = R123lungs(R)

tic;
switch R

    case 1;
    clear all;
    SA    = 59.0*84.75;  %surface area                            [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 66.0;        %plasma membrane potential               [mV]
    fdelm = 150.0;       %mitochondrial membrane potential        [mV]
    Kpgp  = 0.41e-3*SA;  %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 1.0;         %Fixed cytoplasm volume                  [mL]
    V2    = 0.02*V1;     %ApparentR =  mitochondrial matrix volume    [mL]
    Ve    = 10.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 0;           %Rate for dye-cuvette binding            [min^-1]
    kinv  = 0;           %Rate constant for dye-cuvette unbinding [min^-1]
    F     = 10.0;        %Volumetric flow rate                    [mL/min]
    Vr    = 30.0;        %Reservoir volume                        [mL]
    [T,Y] = ode45(@lungeqns, 0:0.1:300, [0 0 0 0 9], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv, F, Vr);
    plot(T, Y(:,1));
    
    case 2; %CCCP, Fig. 2A
    clear all;
    SA    = 59.0;        %bead surface area                       [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 36.0;        %plasma membrane potential               [mV]
    fdelm = 130.0*.01;   %mitochondrial membrane potential        [mV]
    Kpgp  = 0.41e-3*SA;  %Pgp-mediated dye efflux rate            [mL/min]
    V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
    kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'k');
    
    case 3; %high K+, Fig. 2A
    clear all;
    SA    = 59.0;        %bead surface area                       [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 36.0*.01;    %plasma membrane potential               [mV]
    fdelm = 130.0;       %mitochondrial membrane potential        [mV]
    Kpgp  = 0.41e-3*SA;  %Pgp-mediated dye efflux rate            [mL/min]
    V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
    kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'r');
    
    case 4; %GF-120918, Fig. 2A
    clear all;
    SA    = 59.0;        %bead surface area                       [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 36.0;        %plasma membrane potential               [mV]
    fdelm = 130.0;       %mitochondrial membrane potential        [mV]
    Kpgp  = 0;           %Pgp-mediated dye efflux rate            [mL/min]
    V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
    kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'm');
    
    case 51; %CCCP time-variant, Fig. 3A
    clear all;
    alpha = .0374;
    fdelp = -36.0;
    fdelm = -130.0*.01;
    Kpgp = 0.41;
    V1 = 7.4;
    Ve = 3.0; %can also be set to 2.5
    V = 59.0;
    P1S1 = 0.17;
    P2S2 = 0.18;
    kbar1 = 4.3e-3;
    kinv = 8.9e-2;
    [T,Y] = ode45(@Research, [0:0.1:300], [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, V, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
    
    case 52; %CCCP time-variant, Fig. 3A
    clear all;
    alpha = .0374;
    fdelp = -36.0;
    fdelm = -130.0*.01;
    Kpgp = 0.41;
    V1 = 7.4;
    Ve = 3.0; %can also be set to 2.5
    V = 59.0;
    P1S1 = 0.17;
    P2S2 = 0.18;
    kbar1 = 4.3e-3;
    kinv = 8.9e-2;
    [T,Y] = ode45(@Research, [150:0.1:300], [6.5 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, V, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
    case 61; %GF-120918 + High K+
    clear all;
    SA    = 59.0;        %bead surface area                       [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 36.0*.01;    %plasma membrane potential               [mV]
    fdelm = 130.0;       %mitochondrial membrane potential        [mV]
    Kpgp  = 0;           %Pgp-mediated dye efflux rate            [mL/min]
    V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
    kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
    case 62; %GF-120918 + High K+ + CCCP
    clear all;
    SA    = 59.0;        %bead surface area                       [cm^2]
    alpha = .0374;       %ZF/RT                                   [mV^-1]
    fdelp = 36.0*.01;    %plasma membrane potential               [mV]
    fdelm = 130.0*.01;   %mitochondrial membrane potential        [mV]
    Kpgp  = 0;           %Pgp-mediated dye efflux rate            [mL/min]
    V1    = (7.4e-3)*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;     %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;         %Extracellular medium volume             [mL]
    P1S1  = 0.17e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 0.18e-3*SA;  %Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 4.3e-3;      %Rate for dye-cuvette binding            [min^-1]
    kinv  = 8.9e-2;      %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
end

toc;

output = Y;%(:,1);

outfile = input('Enter data file name:', 's');
fid = fopen(outfile, 'w');
for i = 1:length(Y)
    fprintf(fid, '%f %f %f %f %f\n', Y(i,1), Y(i,2), Y(i,3), Y(i,4), Y(i,5));
end
fclose(fid);

y = mean(Y);

end