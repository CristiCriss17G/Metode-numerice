echo off;
global kp t1 t2 t3 u;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = u;
tc = t0;
yc3 = [y10, y20];
k0 = h * ord2p1za(tc, yc3);
k1 = h * ord2p1za(tc+h/2, yc3+k0/2);
k2 = h * ord2p1za(tc+h, yc3+2*k1-k0);
yc2 = yc3 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
k0 = h * ord2p1za(tc, yc2);
k1 = h * ord2p1za(tc+h/2, yc2+k0/2);
k2 = h * ord2p1za(tc+h, yc2+2*k1-k0);
yc1 = yc2 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
for i = 3:q / h
    yca = yc1 + h * (23 * ord2p1za(tc, yc1) - 16 * ord2p1za(tc-h, yc2) ...
        +5 * ord2p1za(tc-2*h, yc3)) / 12;
    yc = yc1 + h * (5 * ord2p1za(tc+h, yca) ...
        +8 * ord2p1za(tc, yc1) - ord2p1za(tc-h, yc2)) / 12;
    while sqrt((yc(1) - yca(1))^2+(yc(2) - yca(2))^2) > prec
        yca = yc;
        yc = yc1 + h * (5 * ord2p1za(tc+h, yca) ...
            +8 * ord2p1za(tc, yc1) - ord2p1za(tc-h, yc2)) / 12;
    end
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
        yca = yc1 + h * (23 * ord2p1za(tc, yc1) - 16 * ord2p1za(tc-h, yc2) ...
            +5 * ord2p1za(tc-2*h, yc3)) / 12;
        yc = yc1 + h * (5 * ord2p1za(tc+h, yca) ...
            +8 * ord2p1za(tc, yc1) - ord2p1za(tc-h, yc2)) / 12;
        while sqrt((yc(1) - yca(1))^2+(yc(2) - yca(2))^2) > prec
            yca = yc;
            yc = yc1 + h * (5 * ord2p1za(tc+h, yca) ...
                +8 * ord2p1za(tc, yc1) - ord2p1za(tc-h, yc2)) / 12;
        end
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