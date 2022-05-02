echo off
global kp tp u;
t(1)=t0;
y(1)=y0;
uc(1)=u;
tc=t0;
yc=y0;
for k=2:(tf-t0)/q+1
    for i=1:q/h
        yc=yc+h*ord1(tc,yc);
        tc=tc+h;
    end
    t(k)=tc;
    y(k)=yc;
    uc(k)=u;
end
clf;
plot(t,y,'-r',t,uc,'-b');
grid;
title('raspuns sistem ordin unu');
xlabel('t[sec]');
ylabel('raspuns');