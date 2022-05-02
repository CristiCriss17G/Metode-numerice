% ord2p1z.mat
echo off;
global kp t1 t2 t3 u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u;
tc = t0;
yc1 = [y10, y20];
for k = 2:(tf - t0) / q + 1
    for i = 1:q / h
        k0 = h * ord2p1za(tc, yc1);
        k1 = h * ord2p1za(tc+h/3, yc1+k0/2);
        k2 = h * ord2p1za(tc+h, yc1+2*k1-k0);
        yc = yc1 + (k0 + 4 * k1 + k2) / 6;
        yc = yc1 + h * (ord2p1za(tc+h, yc) + ord2p1za(tc, yc1)) / 2;
        tc = tc + h;
        yc1 = yc;
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
title("raspuns sistem ordin 2 cu doi poli si un zerou");
subplot(2, 1, 2);
plot(t, y(:, 2), '-b');
grid;
title("derivata raspuns");