%qra, qrb, qrc
echo off;
[m, n] = size(a);
a1 = a;
u = eye(m);
v = eye(n);
kc = min(m-1, n);
kl = min(m, n-2);
for k = 1:max(kc, kl)
    if k <= kc
        sig = 0;
        for i = k:m
            sig = sig + a(i, k)^2;
        end
        sig = sign(a(k, k)) * sqrt(sig);
        t = zeros(1, m);
        for i = 1:m
            if i <= k - 1
                t(i) = 0;
            elseif i == k
                t(i) = sig + a(k, k);
            else
                t(i) = a(i, k);
            end
        end
        beta = sig * (sig + a(k, k));
        u1 = eye(m) - (t' * t) / beta;
        a = u1 * a;
        u = u1 * u;
    end
    clear t;
    if k <= kl
        sig = 0;
        for i = k + 1:n
            sig = sig + a(k, i)^2;
        end
        sig = sign(a(k, k+1)) * sqrt(sig);
        t = zeros(1, n);
        for i = 1:n
            if i <= k
                t(i) = 0;
            elseif i == k + 1
                t(i) = sig + a(k, k+1);
            else
                t(i) = a(k, i);
            end
        end
        beta = sig * (sig + a(k, k+1));
        v1 = eye(n) - (t' * t) / beta;
        a = a * v1;
        v = v * v1;
    end
    clear t;
end