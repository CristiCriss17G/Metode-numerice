function [x, nrit] = met_tang(nume_f, nume_fd, x0, prec)
% Metoda Newton (metoda tangentei) de determinare a solutiei unei ecuatii algebrice
% sau trancendente
%
% (se pot folosi functiile:
%     f1(x)=x^2-7*x+6;
%     f2(x)=exp(x)-5*x;)
x1 = x0 + 2 * prec;
nrit = 0;
while abs(x1-x0) > prec
    x1 = x0;
    x0 = x1 - feval(nume_f, x1) / feval(nume_fd, x1);
    nrit = nrit + 1;
end
x = x0;
end