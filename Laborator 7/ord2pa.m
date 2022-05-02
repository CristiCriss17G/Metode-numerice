function yd = ord2pa(t, y)
global kp t1 t2 a omega
yd(1) = y(2);
yd(2) = (-t1 - t2) / (t1 * t2) * y(2) - 1 / (t1 * t2) * y(1) + kp / (t1 * t2) * a * sin(omega*t);
% yd = yd';
end