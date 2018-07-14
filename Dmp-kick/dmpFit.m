function r=dmpFit(data, fit)
y=data(1,:);
dy=data(2,:);
ddy=data(3,:);
y0=y(1);
g=y(end);
ng=fit.ng;
x=fit.x;
tau=fit.tau;
az=fit.az;
bz=fit.bz;
ax=fit.ax;
h=fit.h;
%% data length and dt
len=length(y);
dt=tau/(len-1);
times=0:dt:tau;
%% calculate g coefficient
fit.con=zeros(1,6);
fit.con(1) = y(1);  %g0
fit.con(2) = dy(1); %gv0
fit.con(3)  = ddy(1); %ga0
fit.con(4)  = y(len); %gT
fit.con(5)  = dy(len); %gvT
fit.con(6) = 0; %gaT
fit.b=gcon_calcu(fit.con,tau);

%% ftarget calculation
xtime=[];
sE=[];  % sE=x(t)(g-y0)  in Ijspeert P343
for i=1:len
    t=times(i);
    x=exp((-1*ax*t)/tau);
    xtime=[xtime x];
    gpV=gF(t,fit.b);
    
    ftarget(i)=(tau^2*ddy(i)-az*(bz*(gpV(1)-y(i))-tau*dy(i)+tau*gpV(2))-tau^2*gpV(3))/(g-y0);
    
    
    sE=[sE; x*(g-y0)];      % ijspeert  P 343
end
% centers of gaussian are placed even in s time
incr=(max(xtime)-min(xtime))/(ng-1);
c=min(xtime):incr:max(xtime);
d=diff(c);
c=c/d(1); % normalize for exp correctness
fit.c=c;

%% Regression
for i=1:ng
    psV=[];
    for j=1:len
        psV=[psV psiF(h,c,xtime(j)/d(1),i)];
    end
    w(i)=(sE'*diag(psV)*ftarget')/(sE'*diag(psV)*sE);
end
%% out
r=fit;
r.len=len;
r.times=times;
r.xtime=xtime;
r.ftarget=ftarget;
r.w=w;
r.y0=y0;
r.g=g;
r.d1=d(1);
r.dt=dt;
end