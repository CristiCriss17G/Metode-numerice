function yd = ord1(t,y)
global kp tp u;
yd = (-y + kp * u)/tp;
end