function yd = ord1sin(t,y)
global kp tp a omega;
yd = (-y + kp * a * sin(omega*t))/tp;
end