function yd = ord2p1zasin(t, y)
global kp t1 t2 t3 a omega;
yd(1) = (-(t3 + t2) * y(1) + kp * t1 * (a*sin(omega*t))) / (t3 * t2) + y(2);
yd(2) = (kp * (a*sin(omega*t)) - y(1)) / (t3 * t2);
end