%ord2p.mat
echo off
global kp t1 t2 a omega;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
uc(1) = a * sin(omega*t0);
tc = t0;
yc3 = [y10, y20];
k0 = h * ord2pa(tc, yc3);
k1 = h * ord2pa(tc+h/2, yc3+k0/2);
k2 = h * ord2pa(tc+h, yc3+2*k1-k0);
yc2 = yc3 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
k0 = h * ord2pa(tc, yc2);
k1 = h * ord2pa(tc+h/2, yc2+k0/2);
k2 = h * ord2pa(tc+h, yc2+2*k1-k0);
yc1 = yc2 + h * (k0 + 4 * k1 + k2) / 6;
tc = tc + h;
for i = 3:q / h
    yca = yc1 + h * (23 * ord2pa(tc, yc1) - 16 * ord2pa(tc-h, yc2) ...
        +5 * ord2pa(tc-2*h, yc3)) / 12;
    yc = yc1 + h * (5 * ord2pa(tc+h, yca) ...
        +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
    while max([abs(yc(1)-yca(1)), abs(yc(2)-yca(2))]) > prec
        yca = yc;
        yc = yc1 + h * (5 * ord2pa(tc+h, yca) ...
            +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
    end
    tc = tc + h;
    yc3 = yc2;
    yc2 = yc1;
    yc1 = yc;
end
t(2) = tc;
y(2, 1) = yc(1);
y(2, 2) = yc(2);
uc(2) = a * sin(omega*tc);
for k = 3:(tf - t0) / q + 1
    for i = 1:q / h
        yca = yc1 + h * (23 * ord2pa(tc, yc1) - 16 * ord2pa(tc-h, yc2) ...
            +5 * ord2pa(tc-2*h, yc3)) / 12;
        yc = yc1 + h * (5 * ord2pa(tc+h, yca) ...
            +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
        while max([abs(yc(1)-yca(1)), abs(yc(2)-yca(2))]) > prec
            yca = yc;
            yc = yc1 + h * (5 * ord2pa(tc+h, yca) ...
                +8 * ord2pa(tc, yc1) - ord2pa(tc-h, yc2)) / 12;
        end
        tc = tc + h;
        yc3 = yc2;
        yc2 = yc1;
        yc1 = yc;
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
title("raspuns sistem ordin 2");
subplot(2, 1, 2);
plot(t, y(:, 2), '-r');
grid;
title("derivata raspuns de ordin 2");