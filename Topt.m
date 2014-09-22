prompt = input('Run default?\n');
if prompt == 0;
    display('Enter comparison cases manually in code.');
    return
else
T1 = 1; %input('Enter first case for optimization:\n');
T2 = 2; %input('Enter second case for optimization:\n');
T3 = 3;
T4 = 4;
end

TMRE(T1);
TMRE(T2);
TMRE(T3);
TMRE(T4);

%read from files
file = input('Enter first file name:', 's');
fid = fopen(file,'r');
data1 = textscan(fid,'%f %f %f %f');
fclose(fid);

file = input('Enter second file name:', 's');
fid = fopen(file,'r');
data2 = textscan(fid,'%f %f %f %f');
fclose(fid);

file = input('Enter third file name:', 's');
fid = fopen(file,'r');
data3 = textscan(fid,'%f %f %f %f');
fclose(fid);

file = input('Enter fourth file name:', 's');
fid = fopen(file,'r');
data4 = textscan(fid,'%f %f %f %f');
fclose(fid);

data = [data1(:,1) data2(:,1) data3(:,1) data4(:,1)];
t = 0:0.1:60;
time = [t;t;t;t];
time = transpose(time);

cell = data{1};
CCCP = data{2};
K    = data{3};
GF   = data{4};
in = [cell CCCP K GF];
%          fdelp     fdelm    Kpgp             V1              P1S1            P2S2
intCond = [.2*49, .2*133, .2*1.92e-3*59, .2*30.5e-3*59, .2*5.2e-3*59];%, .2*37.67e-3*59];

[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(@TMRE_test,intCond,time,in);

%x

