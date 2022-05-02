function [x, nr_it] = opt_grad(x0, epsilon, n)
nr_it = 1;
x_curent = x0;
itermax = 10000; %numar maxim de iteratii
h = 0.001; %var utilizata in calcul gradient
p = 0.01; %pas constant de deplasare

grad_curent = zeros(1,n);
grad_viitor = zeros(1,n);
for k = 1:n
    v = zeros(1, n);
    v(k) = 1;
    grad_curent(k) = (f1(x0+h/2*v) - f1(x0-h/2*v)) / h;
end
while (norm(grad_curent) >= epsilon) && (nr_it <= itermax)
    x_viitor = x_curent - p * grad_curent / norm(grad_curent);
    for k = 1:n
        v = zeros(1, n);
        v(k) = 1;
        grad_viitor(k) = (f1(x_viitor+h/2*v) - f1(x_viitor-h/2*v)) / h;
    end
    x_curent = x_viitor;
    grad_curent = grad_viitor;
    nr_it = nr_it + 1;
end
x = x_curent;
end