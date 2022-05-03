echo off;
[m, n] = size(a);
a1 = a;
q = eye(m);
for k = 1:m-1
    sig = 0;
    for i = k:m
        sig = sig + a(i, k)^2;
    end
    sig = sign(a(k, k)) * sqrt(sig);
    v = zeros(1, m);
    for i = 1:m
        if i <= k - 1
            v(i) = 0;
        elseif i == k
            v(i) = sig + a(k, k);
        else
            v(i) = a(i, k);
        end
    end
    beta = sig * (sig + a(k, k));
    q1 = eye(m) - (v' * v) / beta;
    a = q1 * a;
    q = q * q1;
end