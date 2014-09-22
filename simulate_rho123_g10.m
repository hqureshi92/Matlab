function simulate_rho123_g10 (p0,beta, gama, nPara)
% g2: 04-15-2008, for all conditions
% g3: 04-15-2008, update conditions 
% g4: 04-17-2008, simulation after removing unionized rhodamine123 and
%                 modifying the parameter definitions
% g7: 05-08-2008, add parameter length control
% 98: 05-12-2008, add a condition with 6 paramters only
%g10: 05-22-2008, add a condition fitting the relationship between v2 and
%v3 as v2+v3=0.3767
clear global

% ******************const definition********************
v1 = 2.65;          % volume of solution
k1b = 0.004382;     % tube binding constant
km1 = 0.079704;     % tube unbinding reaction rate, k-1
%k1b=0;
%km1=0;
zf_rt = 0.0374158;    % const of RT/ZF
%****************************************************
ps1 = 0.005;        % initial value of ps1/v1
ps2 = 0.005;       % initial value of ps1/v2
v2  = 0.2;          % initial value of ps2/v2
v3  = 0.02;         % initial value of ps2/v3
vmaxkm = 0.02;      % initial value of delm
delp = 50/10;       % initial value of delp
delm = 160/10;      % initial value of vmaxkm/v2
%********************************************************

a1 = 0.002;        % initial value of ps1/v1
a2 = 0.04;       % initial value of ps1/v2
a3  = 0.002;          % initial value of ps2/v2
a4  = 0.008;         % initial value of ps2/v3
a5 = 0.2;      % initial value of delm
delp = 50/10;       % initial value of delp
delm = 160/10;      % initial value of vmaxkm/v2
%********************************************************

% set general constant values for the model
params = [ps1, ps2, v2, v3, vmaxkm, delp, delm, k1b, km1, zf_rt, v1];
%params = [a1, a2, a3, a4, a5, delp, delm, k1b, km1, zf_2rt, v1];
%********************************************************
data0 =[8.9983	9.0394	8.9963	8.6745	8.9752	8.9418 8.8041	8.9057 8.9983];

p=p0;
para=nPara;
%p = [0.0156    0.0029    0.1643    0.0339    0.0201   25.8621   96.9078];
switch para
    case 7
        % 7 parameters
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = p(4);        % v3
        params(5) = p(5);        % vmaxkm
        params(6) = p(6);        % delp
        params(7) = p(7);        % delm
    case 5
        params(2) = p(1);        % ps2
        params(3) = p(2);        % v2
        params(4) = p(3);        % v3
        params(5) = p(4);        % vmaxkm
        params(7) = p(5);        % delm
    case 6
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = beta*p(3);   % v3
        params(5) = p(4);        % vmaxkm
        params(6) = p(5);        % delp
        params(7) = p(6);        % delm
    case 61
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = p(4);        % v3
        params(5) = 0;           % vmaxkm
        params(6) = p(5);        % delp
        params(7) = p(6);        % delm
    case 62
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = 0.3767-p(3);        % v3
        params(5) = p(4);           % vmaxkm
        params(6) = p(5);        % delp
        params(7) = p(6);        % delm
    case 71
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = p(4);        % v3
        params(5) = p(5);        % vmaxkm
        params(7) = p(6);        % delm
    case 72
        params(1) = p(1);        % ps1
        params(2) = p(2);        % ps2
        params(3) = p(3);        % v2
        params(4) = p(4)*p(3);        % v3
        params(5) = p(5);        % vmaxkm
        params(7) = p(7);        % delm
        gama=p(6);
    otherwise
    
end

nSmall = 0.001;
tt =0:1:300; %   	
contt=tt;
cccptt=tt;
tt150=tt;
cccp150tt=150:1:300;

options = odeset ('RelTol', 1e-6);
%control data
temp = params;
y110  = [data0(1),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8, contt, y110, options, temp);
CELL = Y11(:,1);

%cccp150
temp = params;
temp(7)=nSmall; %                 % delm =0
y110 = [Y11(150,1), Y11(150,2), Y11(150,3), Y11(150,4)];
[T11,Y11] = ode45(@rho123_v8, cccp150tt, y110, options, temp);
CCCP150 = [CELL(1:151); Y11(:,1)];

%CCCP data
temp = params;
%temp(7) =  0.2*temp(7);          % delm=0
temp(7) = nSmall;          % delm=0
%temp(6) = 0.7*temp(6);
y110  = [data0(2),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8,cccptt, y110, options, temp);
CCCP = Y11(:,1);

%gf
temp = params;
temp(5) = 0;          % vmaxkm=0
%temp(7) = 0.9*temp(7);  % delm = 60%
%temp(6) = 0.75*temp(6);  % delp = 50%
y110  = [data0(3),  0,  0, 0]';    
[T11,Y11] = ode45(@rho123_v8,tt150, y110, options, temp);
GF=Y11(:,1);

%gf+cccp150
temp = params;
temp(7)=nSmall; %                 % delm =0
temp(5)=0;                        % vmaxkm =0
y110 = [Y11(150,1), Y11(150,2), Y11(150,3), Y11(150,4)];
[T11,Y11] = ode45(@rho123_v8, cccp150tt, y110, options, temp);
GFCCCP150 = [GF(1:151); Y11(:,1)];

%hk
temp = params;
temp(6) = nSmall+gama*temp(6); %0.4*temp(6);              % delp =0
%temp(6) = 0.4*temp(6);
%temp(7) = 0.7*temp(7);
y110  = [data0(4),  0,  0, 0]';       
[T11,Y11] = ode45(@rho123_v8,tt150, y110, options, temp);
HK=Y11(:,1);

%cccp+gf
temp = params;
temp(5) = 0;             % vmaxkm =0
temp(7) = nSmall;        % delm =0
%temp(7) = 0.2*temp(7);             % delm =0
%temp(6)=0.7*temp(6);       % delp
y110  = [data0(5),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8,cccptt, y110, options, temp);
CCCPGF=Y11(:,1);

%cccp+hk
temp = params;
temp(7) = nSmall;      % delm=0
%temp(6) = nSmall;      % delp =0
%temp(7) = 0.2*temp(7);            % delm=0
temp(6) = nSmall;      % delp =0
y110  = [data0(6),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8,tt150, y110, options, temp);
CCCPHK=Y11(:,1);

%gf+hk
temp = params;
temp(5) = 0.0;             % vamxkm=0
temp(6) = nSmall+gama*temp(6); %0.4*temp(6);     % delp =0
%temp(6) = 0.4*temp(6);     % delp =0
%temp(7) = 0.7*temp(7);
y110  = [data0(7),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8,tt150, y110, options, temp);
GFHK=Y11(:,1);

%cccp+gf+hk
temp = params;
temp(5) = 0.0;             % vamxkm=0
temp(6) = nSmall;               % delp =0
temp(7) = nSmall; %0.2*temp(7);               % delm =0
y110  = [data0(8),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8,tt150, y110, options, temp);
CCCPGFHK=Y11(:,1);

% simulated twice cells
temp = params;
temp(1) = temp(1)*2;          
temp(2) = temp(2)*2;           
temp(3) = temp(3)*2;          
temp(4) = temp(4)*2;
temp(5) = temp(5)*2;
y110  = [data0(9),  0,  0, 0]';
[T11,Y11] = ode45(@rho123_v8, contt, y110, options, temp);
SCELL = Y11(:,1);


str1 = input('Would you like to save these results, input the file name or input 0: ', 's');
if str1 == '0';
else
    fid = fopen(str1,'w');
    for i = 1:length(tt)
       fprintf(fid,'%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',tt(i),CELL(i),CCCP(i), GF(i), HK(i), CCCPGF(i), CCCPHK(i), GFHK(i), CCCPGFHK(i), CCCP150(i), SCELL(i),GFCCCP150(i));
   end
    fclose(fid);
end
  
end
