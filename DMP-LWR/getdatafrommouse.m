function getdatafrommouse
[x,y,vx,vy,ax,ay,nt,ttm,posu,times] = getUserTraj(0.01, 123);
    saveddata.x=x;
    saveddata.y=y;
    saveddata.vx=vx;
    saveddata.vy=vy;
    saveddata.ax=ax;
    saveddata.ay=ay;
    saveddata.times=times;
%     save('saveddata.mat','saveddata') 
    save('saveddata1.mat','saveddata') % you can change the file name.
end