echo off;
global kp tp a omega;
t(1) = t0;
y(1) = y0;
uc(1) = a * sin(omega*t0);
tc = t0;
yc3 = y0;
k0 = h * ord1sin(tc, yc3);
k1 = h * ord1sin(tc+h, yc3+k0);
yc2 = yc3 + (k0 + k1) / 2;
tc = tc + h;
k0 = h * ord1sin(tc, yc2);
k1 = h * ord1sin(tc+h, yc2+k0);
yc1 = yc2 + (k0 + k1) / 2;
tc = tc + h;
for i = 3:q / h
    k0 = h * ord1sin(tc, yc1);
    k1 = h * ord1sin(tc+h, yc1+k0);
    yc = yc1 + (k0 + k1) / 2;
    yc = yc1 + h * (9 * ord1sin(tc+h, yc) + 19 * ord1sin(tc, yc1) ...
        -5 * ord1sin(tc-h, yc2) + ord1sin(tc-2*h, yc3)) / 24;
    yc3 = yc2;
    yc2 = yc1;
    yc1 = yc;
    tc = tc + h;
end
t(2) = tc;
y(2) = yc;
uc(2) = a * sin(omega*t0);
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        k0 = h * ord1sin(tc, yc1);
        k1 = h * ord1sin(tc+h, yc1+k0);
        yc = yc1 + (k0 + k1) / 2;
        yc = yc1 + h * (9 * ord1sin(tc+h, yc) + 19 * ord1sin(tc, yc1) ...
            -5 * ord1sin(tc-h, yc2) + ord1sin(tc-2*h, yc3)) / 24;
        yc3 = yc2;
        yc2 = yc1;
        yc1 = yc;
        tc = tc + h;
    end
    t(k) = tc;
    y(k) = yc;
    uc(k) = a * sin(omega*tc);
end
clf;
figure(1);
plot(t, y, '-r', t, uc, '-b');
grid;
title("raspuns sistem ordin unu");