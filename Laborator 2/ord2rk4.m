echo off
global kp tp omega zeta u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u * sin(omega*t(1));
tc = t0;
yc = [y10 y20];
for k = 2:(tf - t0)/q+1
    for i = 1:q/h
        k0 = h * ord2b(tc, yc);
        k1 = h * ord2b(tc + h/2, yc + k0/2);
        k2 = h * ord2b(tc + h/2, yc + k1/2);
        k3 = h * ord2b(tc + h, yc + k2);
        yc = yc + (k0 + 2*k1 + 2*k2 + k3)/6;
        tc = tc + h;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    uc(k) = u*sin(omega*t(k));
end
figure(3);
clf;
subplot(2,1,1);
plot(t,y(:,1),'-r', t,uc,'-b');
grid;
title("raspuns sistem ordin 2");
subplot(2,1,2);
plot(t,y(:,2),'-b');
grid;
title("derivata raspuns");