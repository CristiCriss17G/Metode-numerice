function J = dF(x)
J = [2 * x(1), 8 * x(2), 2 * x(3); 
    6, 6 * x(2), 3 * x(3)^2; 
    1, -5, -6 * x(3)];
end