%ord2p1z.mat
echo off;
global kp t1 t2 t3 u;
[t, y] = ode23('ord2p1za', [t0, tf], [y10, y20]);
uc = ones(1, length(t)) * u;
% for i = 1:length(t)
%     uc(i) = u;
% end
figure(1);
clf;
subplot(2, 1, 1);
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title('raspuns sistem ordin doi cu doi poli si un zerou real');
subplot(2, 1, 2);
plot(t, y(:, 2), '-r');
grid;
title('derivata raspuns sistem ordin doi');