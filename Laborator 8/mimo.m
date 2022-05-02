function xd = mimo(t, x)
global kp1 kp2 kp3 t1 t2 t3 t4 u1 u2;
xd(1) = (kp1 * u1 + kp1 * u2 - x(2)) / (t2 * t3);
xd(2) = (kp1 * t1 * u1 - (t2 + t3) * x(2)) / (t2 * t3) + x(1);
xd(3) = (kp2 * u2 + kp3 * u1 - x(4)) / (t2 * t3);
xd(4) = (kp3 * t4 * u1 - (t2 + t3) * x(4)) / (t2 * t3) + x(3);
xd = xd';
end