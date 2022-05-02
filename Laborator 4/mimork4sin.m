echo off
global kp1 kp2 kp3 t1 t2 t3 t4 a1 omega1 a2 omega2;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
y(1, 3) = y30;
y(1, 4) = y40;
uc1(1) = a1*sin(omega1*t0);
uc2(1) = a2*sin(omega2*t0);
tc = t0;
yc = [y10, y20, y30, y40];
for k = 2:(tf - t0) / q + 1
    for i = 1:q / h
        k0 = h * mimosin(tc, yc);
        k1 = h * mimosin(tc+h/2, yc+k0/2);
        k2 = h * mimosin(tc+h/2, yc+k1/2);
        k3 = h * mimosin(tc+h, yc+k2);
        yc = yc + (k0 + 2 * k1 + 2 * k2 + k3) / 6;
        tc = tc + h;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    y(k, 3) = yc(3);
    y(k, 4) = yc(4);
    uc1(k) = a1*sin(omega1*tc);
    uc2(k) = a2*sin(omega2*tc);
end
figure(1);
clf;
subplot(2, 1, 1);
plot(t, y(:, 2), '-r', t, uc1, '-b');
grid;
title("iesire si intrare 1");
subplot(2, 1, 2);
plot(t, y(:, 4), '-r', t, uc2, '-b');
grid;
title("iesire si intrare 2");