%read from file
savefile = 'TMREcells.dat';
fid = fopen(savefile, 'w');
load TMRE_data.txt

for i = 1:1:9;
t(i) = TMRE_data(i,1);
cells(i) = TMRE_data(i,2);
end

for i = 1:1:9;
fprintf(fid, '%f %f\n', t(i), cells(i));
end
fclose(fid);

load TMREcells.dat

time = TMREcells(:,1);
cells = TMREcells(:,2);

% cells = (data{1}); %medium dye concentration
% time = 0:0.1:60;
% time = transpose(time);

intCond = [.2*49 .2*133 .2*1.92e-3*28 .2*30.5e-3*28 .2*5.20e-3*28 .2*37.67e-3*28];

tic;
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(@TMRE_test,intCond,time,cells,[0 0 0 0 0 0],[140 60 3 35 7 100]);
toc;

fit = zeros(601,4);
param = [.0374 x(1) x(2) x(3) x(4) 3 x(5) x(6) 7.9e-3 5.4e-2];
[t,fit] = ode45(@Research, 0:0.1:60, time, [], .0374, x(1), x(2), x(3), x(4), 3, x(5), x(6), 7.9e-3, 5.4e-2);

subplot(2,1,1);
plot(time,cells,'.-r',t,fit(:,1),'--k');

subplot(2,1,2);
plot(time,residual,'v:');