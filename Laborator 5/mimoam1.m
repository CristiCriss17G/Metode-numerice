echo off
global kp1 kp2 kp3 t1 t2 t3 t4 u1 u2;
t(1) = t0;
y(1, 1) = y10;
y(1, 2) = y20;
y(1, 3) = y30;
y(1, 4) = y40;
uc1(1) = u1;
uc2(1) = u2;
tc = t0;
yc1 = [y10, y20, y30, y40];
for k=2:(tf-t0)/q+1
    for i = 1:q / h
        k0 = h * mimo(tc, yc1);
        k1 = h * mimo(tc+h/3, yc1+k0/3);
        k2 = h * mimo(tc+2*h/3, yc1+2/3*k1);
        yc=yc1+(k0+3*k2)/4;
        yc = yc1 + h*(mimo(tc+h,yc)+mimo(tc,yc1))/2;
        tc = tc + h;
        yc1=yc;
    end
    t(k) = tc;
    y(k, 1) = yc(1);
    y(k, 2) = yc(2);
    y(k, 3) = yc(3);
    y(k, 4) = yc(4);
    uc1(k) = u1;
    uc2(k) = u2;
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