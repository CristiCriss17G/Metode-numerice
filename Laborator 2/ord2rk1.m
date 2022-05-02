echo off
% clear all
% load ord2
global kp tp zeta u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u;
tc = t0;
yc = [y10 y20];
for k = 2:(tf - t0)/q+1
    for i = 1:q/h
        yc = yc + h * ord2b(tc, yc);
        tc = tc + h;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    uc(k) = u;
end
figure(1);
clf;
subplot(2,1,1);
plot(t,y(:,1),'-r', t,uc,'-b');
grid;
title("raspuns sistem ordin 2");
subplot(2,1,2);
plot(t,y(:,2),'-b', t,uc,'-g');
grid;
title("derivata raspuns");