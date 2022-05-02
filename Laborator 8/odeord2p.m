echo off;
global kp t1 t2 a omega;
[t, y] = ode45('ord2pa', [t0, tf], [y10, y20]);
uc = zeros(1, length(t));
for i = 1:length(t)
    uc(i) = a * sin(omega*t(i));
end
figure(1);
clf;
plot(t, y(:, 1), '-r', t, uc, '-b');
grid;
title('raspuns sistem ordin doi');