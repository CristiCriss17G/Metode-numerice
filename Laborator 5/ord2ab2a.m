echo off;
global kp tp zeta u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u;
tc = t0;
yc3 = [y10, y20];
k0 = h * ord2a(tc, yc3);
k1 = h * ord2a(tc+h, yc3+k0);
yc2 = yc3 + (k0 + k1) / 2;
tc = tc + h;
k0 = h * ord2a(tc, yc2);
k1 = h * ord2a(tc+h, yc2+k0);
yc1 = yc2 + (k0 + k1) / 2;
tc = tc + h;
for i = 3:q / h
    yc = yc1 + h * (23 * ord2a(tc, yc1) - 16 * ord2a(tc-h, yc2) ...
        +5 * ord2a(tc-2*h, yc3)) / 12;
    tc = tc + h;
    yc3 = yc2;
    yc2 = yc1;
    yc1 = yc;
end
t(2) = tc;
y(2, 1) = yc(1);
y(2, 2) = yc(2);
uc(2) = u;
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        yc = yc1 + h * (23 * ord2a(tc, yc1) - 16 * ord2a(tc-h, yc2) ...
            +5 * ord2a(tc-2*h, yc3)) / 12;
        tc = tc + h;
        yc3 = yc2;
        yc2 = yc1;
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