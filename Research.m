function dy = Research(t, y, alpha, fdelp, fdelm, Kpgp, V1, Ve, P1S1, P2S2, kbar, kinv)

%%Code for dye concentration

dy = zeros(4,1);

%     alpha = ZF/RT                                   [mV^-1]
%     fdelp = plasma membrane potential               [mV]
%     fdelm = mitochondrial membrane potential        [mV]
%     Kpgp  = Pgp-mediated dye efflux rate            [mL/min]
%     V1    = Apparent cytoplasm volume               [mL]
%     V2    = Apparent mitochondrial matrix volume    [mL]
%     Ve    = Extracellular medium volume             [mL]
%     P1S1  = Dye permeability-surface area product across plasma membrane        [mL/min]
%     P2S2  = Dye permeability-surface area product across mitochondrial membrane [mL/min]
%     kbar = Rate for dye-cuvette binding            [min^-1]
%     kinv  = Rate constant for dye-cuvette unbinding [min^-1]

    %Eq. 7
    %fdelp = del*delp + (1-del)*delp*exp(-t/tau);
    %Eq. 9
    %fdelm = (1/alpha) * log((beta*(Res0-Res1)*Res2) / (Res0*((1+beta)*Res1-Res2)) - beta*Res1*Res2);

    %Eqs. 5-6
    J1 = ((alpha*fdelp) / (exp(alpha*fdelp) - 1)) * ((exp(alpha*fdelp)) * y(1) - y(2)); %Dye flux across plasma membrane [pmol/cm^-2]
    J2 = ((alpha*fdelm) / (exp(alpha*fdelm) - 1)) * ((exp(alpha*fdelm)) * y(2) - y(3)); %Dye flux across inner mitochondrial membrane [pmol/cm^-2]
    
    V2 = 0.02*V1; %Apparent mitochondrial matrix volume    [mL]
    %Eq. 1 (d[Re]/dt)
    dy(1) = (Kpgp/Ve)*y(2) - (P1S1*J1)/Ve - kbar*y(1) + kinv*y(4);
    %Eq. 2 (d[Rc]/dt)
    dy(2) = -(Kpgp/V1)*y(2) + (P1S1*J1)/V1 - (P2S2*J2)/V1;
    %Eq. 3 (d[Rm]/dt)
    dy(3) = (P2S2*J2)/V2;
    %Eq. 4 (d[ReBe]/dt)
    dy(4) = kbar*y(1) - kinv*y(4);