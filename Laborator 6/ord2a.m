function yd = ord2a(t, y)
global kp tp zeta u;
yd(1) = y(2);
yd(2) = (kp * u - y(1)) / tp^2 - (2 * zeta * y(2)) / tp;
yd = yd';
end