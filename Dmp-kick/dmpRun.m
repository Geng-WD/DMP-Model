function result=dmpRun(r)

% from now on it dmp replay and plots
r.b=gcon_calcu(r.con,r.tau);
f_run=[];

ydd_r=0;
yd_r=0;
y_r=r.y0;
dt=r.dt;


ydd_out(1)=ydd_r;
yd_out(1)=yd_r;
y_out(1)=y_r;

for j=2:length(r.times)
    psum=0;
    pdiv=0;
    for i=1:r.ng
        psum=psum+psiF(r.h, r.c, r.xtime(j)/r.d1,i)*r.w(i);
        pdiv=pdiv+psiF(r.h, r.c, r.xtime(j)/r.d1,i);
    end
    % replay of f with trained weights
    % ijspeert nc2013 page 333 formula 2.3
    f_run(j)=(psum/pdiv)*r.xtime(j)*(r.g-r.y0);
    gpV=gF(r.times(j),r.b);
    
    ydd_r=(r.az*(r.bz*(gpV(1)-y_r)-r.tau*yd_r+r.tau*gpV(2))+gpV(3)*r.tau^2+(r.g-r.y0)*f_run(j))/r.tau^2;
    yd_r= yd_r+ (ydd_r*dt)/r.tau;
    y_r= y_r+ (yd_r*dt)/r.tau;
    
    ydd_out(j)=ydd_r;
    yd_out(j)=yd_r;
    y_out(j)=y_r;
end

result=r;
result.ydd=ydd_out;
result.yd=yd_out;
result.y=y_out;
result.f_replay=f_run;



end