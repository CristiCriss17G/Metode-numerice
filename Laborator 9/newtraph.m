function [sol, iter] = newtraph(nume_F, nume_dF, x0, prec)
% Metoda Newton-Raphson de rezolvare a Sistemelor Patratice de Ecuatii Neliniare
% x0 este punct de start, ca vector coloana
n = length(x0);
dx = 2 * prec * ones(n, 1);
x_c = x0;
iter = 0;
while (norm(dx) > prec)
    %functia norm, din bib Matlab, calc norma euclidiana a unui vector
    J = feval(nume_dF, x_c);
    dx = -inv(J) * feval(nume_F, x_c);
    %functia inv, din bib Matlab, calc inversa unei matrici patratice
    x_c = x_c + dx;
    iter = iter + 1;
end
sol = x_c;
end