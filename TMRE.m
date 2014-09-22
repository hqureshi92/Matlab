%Parameter values are for TMRE
function output = TMRE(T)

switch T
    
    case 1;
    clear all;
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
    case 2; %CCCP, Fig. 2B
    clear all;
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    fdelm = 133.0*.01;  %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'k');
    
    case 3; %high K+, Fig. 2B
    clear all;
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0*.01;   %plasma membrane potential               [mV]
    fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'r');
    
    case 4; %GF-120918, Fig. 2B
    clear all;
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 0;          %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'm');
    
    case 51; %CCCP time-variant, Fig. 3B
    clear all;
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    fdelm = 133.0*.01;  %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:80], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'k');
    
    case 52; %CCCP time-variant, Fig. 3B
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    fdelm = 133.0*.01;  %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [60:0.1:80], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1), 'k');    
    
    case 61; %GF-120918 + High K+
    SA    = 28.0;       %bead surface area                       [cm^2]
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0*.01;   %plasma membrane potential               [mV]
    fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 0;          %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
        
    case 62; %GF-120918 + High K+ + CCCP
    SA    = 28.0;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0*.01;   %plasma membrane potential               [mV]
    fdelm = 133.0*.01;  %mitochondrial membrane potential        [mV]
    Kpgp  = 0;          %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@Research, [0:0.1:60], [19 0 0 0], [], alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    plot(T, Y(:,1));
    
end

output = Y(:,1);

outfile = input('Enter data file name:', 's');
fid = fopen(outfile, 'w');
for i = 1:length(Y)
    fprintf(fid, '%f %f %f %f\n', Y(i,1), Y(i,2), Y(i,3), Y(i,4));
end
fclose(fid);

end