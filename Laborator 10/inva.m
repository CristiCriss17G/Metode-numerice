%qra.mat
%% qra
echo off;
[m, n] = size(a);
a1 = a;
q = eye(n);
for k = 1:n - 1
    sig = 0;
    for i = k:n
        sig = sig + a(i, k)^2;
    end
    sig = sign(a(k, k)) * sqrt(sig);
    v = zeros(1, n);
    for i = 1:n
        if i <= k - 1
            v(i) = 0;
        elseif i <= k
            v(i) = sig + a(k, k);
        else
            v(i) = a(i, k);
        end
    end
    beta = sig * (sig + a(k, k));
    q1 = eye(n) - (v' * v) / beta;
    a = q1 * a;
    q = q1 * q;
end
%qra-end

%% inv_sup_tri
for k = n:-1:1
    a(k, k) = 1 / a(k, k);
    for i = k - 1:-1:1
        s = 0;
        for j = i + 1:n
            s = s + a(i, j) * a(j, k);
        end
        a(i, k) = -s / a(i, i);
    end
end
a=a*q;