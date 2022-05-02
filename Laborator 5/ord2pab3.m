echo off;
global kp t1 t2 a omega;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = a * sin(omega*t0);
tc = t0;
yc4 = [y10, y20];
k0 = h * ord2pa(tc, yc4);
k1 = h * ord2pa(tc+h/2, yc4+k0/2);
k2 = h * ord2pa(tc+h, yc4+2*k1-k0);
yc3 = yc4 + (k0 + 4 * k1 + k2) / 6;
k0 = h * ord2pa(tc, yc3);
k1 = h * ord2pa(tc+h/2, yc3+k0/2);
k2 = h * ord2pa(tc+h, yc3+2*k1-k0);
yc2 = yc3 + (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
k0 = h * ord2pa(tc, yc2);
k1 = h * ord2pa(tc+h/2, yc2+k0/2);
k2 = h * ord2pa(tc+h, yc2+2*k1-k0);
yc1 = yc2 + (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
for i = 4:q / h
    yc = yc1 + h * (55 * ord2pa(tc, yc1) - 59 * ord2pa(tc-h, yc2) ...
        +37 * ord2pa(tc-2*h, yc3) - 9 * ord2pa(tc-3*h, yc4)) / 12;
    tc = tc + h;
    yc4 = yc3;
    yc3 = yc2;
    yc2 = yc1;
    yc1 = yc;
end
t(2) = tc;
y(2, 1) = yc(1);
y(2, 2) = yc(2);
uc(2) = a * sin(omega*t0);
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        yc = yc1 + h * (55 * ord2pa(tc, yc1) - 59 * ord2pa(tc-h, yc2) ...
            +37 * ord2pa(tc-2*h, yc3) - 9 * ord2pa(tc-3*h, yc4)) / 12;
        tc = tc + h;
        yc4 = yc3;
        yc3 = yc2;
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
title("raspuns sistem ordin doi");
subplot(2, 1, 2);
plot(t, y(:, 2), '-r');
grid;
title("derivata raspuns sistem ordin doi la in tr sin");
