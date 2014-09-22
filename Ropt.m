prompt = input('Run default?\n');
if prompt == 0;
    display('Enter comparison cases manually in code.');
    return
else
R1 = 1; %input('Enter first case for optimization:\n');
R2 = 2; %input('Enter second case for optimization:\n');
R3 = 3;
R4 = 4;
end

R123(R1);
R123(R2);
R123(R3);
R123(R4);

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
t = 0:0.1:120;
time = [t;t;t;t];
time = transpose(time);

cell = data{1};
CCCP = data{2};
K    = data{3};
GF   = data{4};
in = [cell CCCP K GF];
%          fdelp     fdelm    Kpgp             V1              P1S1            P2S2
intCond = [.2*36, .2*130, .2*0.41e-3*59, .2*7.4e-3*59, .2*.17e-3*59, .2*.18e-3*59];

[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(@R123_test,intCond,time,in);

%x

