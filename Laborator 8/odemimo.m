%mimo4.matexit
echo off;
global kp1 kp2 kp3 t1 t2 t3 t4 u1 u2;
[t, y] = ode45('mimo', [t0, tf], [y10, y20, y30, y40]);
uc1 = ones(1, length(t)) * u1;
uc2 = ones(1, length(t)) * u2;
% for i = 1:length(t)
%     uc(i) = u;
% end
figure(1);
clf;
subplot(2, 1, 1);
plot(t, y(:, 2), '-r', t, uc1, '-g', t, uc2, '-b');
grid;
title('iesire si intrare 1');
subplot(2, 1, 2);
plot(t, y(:, 4), '-r', t, uc1, '-g', t, uc2, '-b');
grid;
title('iesire si intrare 2');