function yd = ord2p1za(t, y)
global kp t1 t2 t3 u;
yd(1) = (-(t3 + t2) * y(1) + kp * t1 * u) / (t3 * t2) + y(2);
yd(2) = (kp * u - y(1)) / (t3 * t2);
end