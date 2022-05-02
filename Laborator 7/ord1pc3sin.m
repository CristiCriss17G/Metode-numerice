echo off
global kp tp a omega;
t(1) = t0;
y(1) = y0;
uc(1) = a*sin(omega*t0);
tc = t0;
yc4=y0;
k0 = h * ord1sin(tc, yc4);
k1 = h * ord1sin(tc+h/2, yc4+k0/2);
k2 = h * ord1sin(tc+h, yc4+2*k1-k0);
yc3 = yc4 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
k0 = h * ord1sin(tc, yc3);
k1 = h * ord1sin(tc+h/2, yc3+k0/2);
k2 = h * ord1sin(tc+h, yc3+2*k1-k0);
yc2 = yc3 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
k0 = h * ord1sin(tc, yc2);
k1 = h * ord1sin(tc+h/2, yc2+k0/2);
k2 = h * ord1sin(tc+h, yc2+2*k1-k0);
yc1 = yc2 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
for i = 4:q / h
    yca = yc1 + h * (55 * ord1sin(tc, yc1) - 59 * ord1sin(tc-h, yc2) ...
        +37 * ord1sin(tc-2*h, yc3)-9*ord1sin(tc-3*h,yc4)) / 24;
    yc = yc1 + h * (9 * ord1sin(tc+h, yca) +19 * ord1sin(tc, yc1)...
        - 5*ord1sin(tc-h, yc2) + ord1sin(tc-2*h,yc3)) / 24;
    while abs(yc-yca) > prec
        yca = yc;
        yc = yc1 + h * (9 * ord1sin(tc+h, yca) +19 * ord1sin(tc, yc1)...
        - 5*ord1sin(tc-h, yc2) + ord1sin(tc-2*h,yc3)) / 24;
    end
    tc = tc + h;
    yc3 = yc2;
    yc2 = yc1;
    yc1 = yc;
end
t(2) = tc;
y(2) = yc;
uc(2) = a*sin(omega*tc);
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        yca = yc1 + h * (55 * ord1sin(tc, yc1) - 59 * ord1sin(tc-h, yc2) ...
            +37 * ord1sin(tc-2*h, yc3)-9*ord1sin(tc-3*h,yc4)) / 24;
        yc = yc1 + h * (9 * ord1sin(tc+h, yca) +19 * ord1sin(tc, yc1)...
            - 5*ord1sin(tc-h, yc2) + ord1sin(tc-2*h,yc3)) / 24;
        while abs(yc-yca) > prec
            yca = yc;
            yc = yc1 + h * (9 * ord1sin(tc+h, yca) +19 * ord1sin(tc, yc1)...
                - 5*ord1sin(tc-h, yc2) + ord1sin(tc-2*h,yc3)) / 24;
        end
        tc = tc + h;
        yc3 = yc2;
        yc2 = yc1;
        yc1 = yc;
    end
    t(k) = tc;
    y(k) = yc;
    uc(k) = a*sin(omega*t(k));
end
figure(1);
clf;
% subplot(2, 1, 1);
plot(t, y, '-r', t, uc, '-b');
grid;
title("raspuns sistem ordin unu");
% subplot(2, 1, 2);
% plot(t, y, '-r');
% grid;
% title("derivata raspuns de ordin 2");