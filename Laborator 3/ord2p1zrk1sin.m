echo off
global kp t1 t2 t3 a omega;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = a * sin(omega*t(1));
tc = t0;
yc = [y10, y20];
for k = 2:(tf - t0) / q + 1
    for i = 1:q / h
        yc = yc + h * ord2p1zasin(tc, yc);
        tc = tc + h;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    uc(k) = a * sin(omega*t(k));
end
figure(1);
clf;
subplot(2, 1, 1);
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title("raspuns sistem ordin 2 cu doi poli si un zerou");
subplot(2, 1, 2);
plot(t, y(:, 2), '-b');
grid;
title("derivata x2");