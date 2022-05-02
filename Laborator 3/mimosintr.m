function xd = mimosintr(t, x)
global kp1 kp2 kp3 t1 t2 t3 t4 u a omega;
xd(1) = (kp1 * u + kp1 * a * sin(omega*t) - x(2)) / (t2 * t3);
xd(2) = (kp1 * t1 * u - (t2 + t3) * x(2)) / (t2 * t3) + x(1);
xd(3) = (kp2 * a * sin(omega*t) + kp3 * u - x(4)) / (t2 * t3);
xd(4) = (kp3 * t4 * u - (t2 + t3) * x(4)) / (t2 * t3) + x(3);
end