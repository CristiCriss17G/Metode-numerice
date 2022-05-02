function xd = ord2b1(t, x)
global kp tp zeta u;
xd(1) = (kp*u - x(2))/tp^2;
xd(2) = -2*zeta*x(2)/tp + x(1);
end