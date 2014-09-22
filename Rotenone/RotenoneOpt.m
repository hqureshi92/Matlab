savefile = 'TMREcells.dat';
fid = fopen(savefile, 'w');
load TMRE_data.txt

for i = 1:1:9;
tt(i) = TMRE_data(i,1);
cells(i) = TMRE_data(i,2);
end

for i = 1:1:9;
fprintf(fid, '%f %f\n', tt(i), cells(i));
end
fclose(fid);

load TMREcells.dat

cells = TMREcells(:,2);

load rotenone.mat

data = [control_Rotenone(1:9,2) high_K_Rotenone(1:9,2) cells];
t = control_Rotenone(1:9,1);
time = [t t t];

%          fdelp     fdelm    Kpgp             V1           P1S1            P2S2
intCond = [133.0];%, .2*1.92e-3*28, .2*30.5e-3*28, .2*5.2e-3*28, .2*36.67e-3*59];

[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(@Rotenone,intCond,time,data);

%x

fit1 = control_Rotenone(1:9,2) - residual(:,1);
fit2 = high_K_Rotenone(1:9,2)  - residual(:,2);
fit3 = cells                   - residual(:,3);

subplot(2,1,1);
plot(t,control_Rotenone(1:9,2),'.-r',t,fit1(:,1),'--r',t,high_K_Rotenone(1:9,2),'.-b',t,fit2(:,1),'--b',t,cells,'-k',t,fit3(:,1),'--k');

subplot(2,1,2);
plot(t,residual(:,1),'rv:',t,residual(:,2),'bv:',t,residual(:,3),'kv:');