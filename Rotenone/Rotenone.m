%Rotenone optimize function

function output = Rotenone(x,t)

    tic;
    
    %cells only
    SA    = 25.43;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    %fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 0;%1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@eqnsolv, [0;5;10;15;20;30;40;50;60], [19 0 0 0], [], alpha, fdelp, x(1), Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    output1 = Y(:,1);
    %[Tc,Yc] = ode45(@Research, [61;65;70;80], Y, [], alpha, fdelp, x(1), Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    
%     %CCCP
%     SA    = 28.0;       %bead surface area                       [cm^2]        
%     alpha = .0374;      %ZF/RT                                   [mV^-1]
%     %fdelp = 49.0;       %plasma membrane potential               [mV]
%     fdelm = 133.0*.01;  %mitochondrial membrane potential        [mV]
%     %Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
%     %V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
%     %V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
%     Ve    = 3.0;        %Extracellular medium volume             [mL]
%     %P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
%     %P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
%     kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
%     kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
%     [T,Y] = ode45(@eqnsolv, [0:0.1:60], [19 0 0 0], [], alpha, x(1), fdelm, x(3), x(4), Ve, x(5), P2S2, kbar1, kinv);
%     output2 = Y(:,1);
    
    %high K+
    SA    = 27.30;       %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0*.01;   %plasma membrane potential               [mV]
    %fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    %Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@eqnsolv, [0;5;10;15;20;30;40;50;60], [19 0 0 0], [], alpha, fdelp, x(1), Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    output2 = Y(:,1);
    
    SA    = 29.019;     %bead surface area                       [cm^2]        
    alpha = .0374;      %ZF/RT                                   [mV^-1]
    fdelp = 49.0;       %plasma membrane potential               [mV]
    %fdelm = 133.0;      %mitochondrial membrane potential        [mV]
    Kpgp  = 1.92e-3*SA; %Pgp-mediated dye efflux rate            [mL/min]
    V1    = 30.5e-3*SA; %Apparent cytoplasm volume               [mL]
    V2    = 0.02*V1;    %Apparent mitochondrial matrix volume    [mL]
    Ve    = 3.0;        %Extracellular medium volume             [mL]
    P1S1  = 5.2e-3*SA;  %Dye permeability-surface area product across plasma membrane        [mL/min]
    P2S2  = 36.67e-3*SA;%Dye permeability-surface area product across mitochondrial membrane [mL/min]
    kbar1 = 7.9e-3;     %Rate for dye-cuvette binding            [min^-1]
    kinv  = 5.4e-2;     %Rate constant for dye-cuvette unbinding [min^-1]
    [T,Y] = ode45(@eqnsolv, [0;5;10;15;20;30;40;50;60], [19 0 0 0], [], alpha, fdelp, x(1), Kpgp, V1, Ve, P1S1, P2S2, kbar1, kinv);
    output3 = Y(:,1);
    
    toc;
    
output = [output1 output2 output3];