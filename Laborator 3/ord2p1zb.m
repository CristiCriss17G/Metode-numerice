function xd = ord2p1zb(t, x)
global kp t1 t2 t3 u;
xd(1) = (kp * u - x(2)) / (t3 * t2);
xd(2) = (-(t3 + t2) * x(2) + kp * t1 * u) / (t3 * t2) + x(1);
end