%sa se faca prgramul matlab pentru a simula rapsunsul sistemului de ord 1
%la semnal de intrare sunisoidal de pulsatie omega si amplitudine a tot
%prin metoda rogue-kuta de ord 1
echo off
global kp tp a omega;
t(1)=t0;
y(1)=y0;
uc(1)=a*sin(omega*t(1));
tc=t0;
yc=y0;
for k=2:(tf-t0)/q+1
    for i=1:q/h
        yc=yc+h*ord1sin(tc,yc);
        tc=tc+h;
    end
    t(k)=tc;
    y(k)=yc;
    uc(k)=a*sin(omega*t(k));
end
clf;
plot(t,y,'-r',t,uc,'-b');
grid;
title('raspuns sistem ordin unu');
xlabel('t[sec]');
% ylabel('raspuns');