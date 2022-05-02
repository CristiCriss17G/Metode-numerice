function xd = mimosin(t, x)
global kp1 kp2 kp3 t1 t2 t3 t4 a1 a2 omega1 omega2;
xd(1) = (kp1 * (a1 * sin(omega1*t)) + kp1 * (a2 * sin(omega2*t) - x(2))) / (t2 * t3);
xd(2) = (kp1 * t1 * (a1 * sin(omega1*t) - (t2 + t3) * x(2))) / (t2 * t3) + x(1);
xd(3) = (kp2 * (a2 * sin(omega2*t)) + kp3 * (a1 * sin(omega1*t) - x(4))) / (t2 * t3);
xd(4) = (kp3 * t4 * (a1 * sin(omega1*t) - (t2 + t3) * x(4))) / (t2 * t3) + x(3);
end