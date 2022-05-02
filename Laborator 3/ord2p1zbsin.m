function xd = ord2p1zbsin(t, x)
global kp t1 t2 t3 a omega;
xd(1) = (kp * a * sin(omega*t) - x(2)) / (t3 * t2);
xd(2) = (-(t3 + t2) * x(2) + kp * t1 * a * sin(omega*t)) / (t3 * t2) + x(1);
end