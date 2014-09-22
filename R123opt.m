intCond = [.001*0.41e-3*59]; %test dye binding coeff.

%read from file
file = 'R123cells.dat';
fid = fopen(file,'r');
data = textscan(fid,'%f %f %f %f');
fclose(fid);

cells = (data{1}); %medium dye concentration
time = 0:0.1:120;
time = transpose(time);
tic;
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(@R123_test,intCond,time,cells);
toc;
display(toc);

%plot
fit = zeros(length(time),1);
param = [.0374 36 130 x 7.4e-3*59 3 .17e-3*59 .18e-3*59 4.3e-3 8.9e-2];
[t,fit] = ode45(@Research, 0:0.1:120, [9 0 0 0], [], .0374, 36, 130, x, 7.4e-3*59, 3, .17e-3*59, .18e-3*59, 4.3e-3, 8.9e-2);

subplot(2,1,1);
plot(time,cells,':r',t,fit(:,1),'--k');

subplot(2,1,2);
plot(time,residual,'v:')