%ord2.mat
echo off;
global kp tp zeta u;
[t, y] = ode45('ord2a', [t0, tf], [y10, y20]);
uc = ones(1, length(t))*u;
% for i = 1:length(t)
%     uc(i) = u;
% end
figure(1);
clf;
subplot(2,1,1);
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title('raspuns sistem ordin doi');
subplot(2,1,2);
plot(t,y(:,2),'-r');
grid;
title('derivata raspuns sistem ordin doi');