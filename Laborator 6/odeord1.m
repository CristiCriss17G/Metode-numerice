echo off;
global kp tp a omega;
[t, y] = ode23('ord1sin', [t0, tf], y0);
uc = zeros(1, length(t));
for i = 1:length(t)
    uc(i) = a * sin(omega*t(i));
end
figure(1);
clf;
plot(t, y, '-r', t, uc, '-b');
grid;
title('raspuns sistem ordin unu');