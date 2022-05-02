% ord2p.mat
echo off;
global kp t1 t2 a omega;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = a * sin(omega*t0);
tc = t0;
yc2 = [y10, y20];
yc1 = yc2 + h * ord2pa(tc, yc2);
tc = tc + h;
for i = 2:q / h
    yc = yc1 + h * ord2pa(tc, yc2);
    yc = yc1 + h * (5 * ord2pa(tc+h, yc) ...
        +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
    tc = tc + h;
    yc2 = yc1;
    yc1 = yc;
end
t(2) = tc;
y(2, 1) = yc(1);
y(2, 2) = yc(2);
uc(2) = a * sin(omega*t0);
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        yc = yc1 + h * ord2pa(tc, yc2);
        yc = yc1 + h * (5 * ord2pa(tc+h, yc) ...
            +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
        tc = tc + h;
        yc2 = yc1;
        yc1 = yc;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    uc(k) = a * sin(omega*tc);
end
clf;
figure(1);
subplot(2, 1, 1);
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title("raspuns sistem ordin doi cu doi poli");
subplot(2, 1, 2);
plot(t, y(:, 2), '-r');
grid;
title("derivata raspuns sistem ordin doi");
