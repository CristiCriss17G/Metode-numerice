function yd = ord2b(t, x)
global kp tp zeta u;
yd(1) = -2*zeta*x(1)/tp + x(2);
yd(2) = (kp*u - x(1))/tp^2;
end