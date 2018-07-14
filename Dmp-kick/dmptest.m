clear
load demodata.mat;
% equation
fit.tau=1.28;
fit.az=20;
fit.bz=5;
fit.ax=1;
fit.x=1;%phase value
fit.ng=40;
fit.h=ones(1,fit.ng)*1;
% fit demodata
r=dmpFit(demodata,fit);

%  replay dmp
% y0=r.y0;
% g=r.g;
%  r.g=2;
% r.y0=-1;
% r.con(5)=-2; %velocity
% result=dmpRun(r);
len = r.len;
dy=demodata(2,:);
hold on
 for ii=-5:5
r.con(5)  =  dy(len) + ii*1; %gT
 
r.b=gcon_calcu(r.con,r.tau);
 
result=dmpRun(r);
 
plot(r.times,result.y ,'--');
 end
 hold off
% plot(r.times,demodata(1,:),'r',r.times,result.y,'b');
