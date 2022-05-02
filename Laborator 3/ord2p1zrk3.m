echo off
global kp t1 t2 t3 u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u;
tc = t0;
yc = [y10, y20];
for k = 2:(tf - t0) / q + 1
    for i = 1:q / h
        k0 = h * ord2p1zb(tc, yc);
        k1 = h * ord2p1zb(tc+h/2, yc+k0/2);
        k2 = h * ord2p1zb(tc+h, yc+k1);
        yc = yc + (k0 + 4 * k1 + k2) / 4;
        tc = tc + h;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    uc(k) = u;
end
figure(1);
clf;
subplot(2, 1, 1);
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title("raspuns sistem ordin 2");
subplot(2, 1, 2);
plot(t, y(:, 2), '-b');
grid;
title("derivata raspuns");