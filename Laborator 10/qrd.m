echo off;
[m, n] = size(a);
a1 = a;
q = eye(m);
p = eye(n);
k = 1;
ind = 1;
norm = zeros(1, n);
for j = 1:n
    %     norm(j)=0;
    for i = 1:m
        norm(j) = norm(j) + a(i, j)^2;
    end
end
while ind == 1 && k <= n
    l = k;
    for j = k + 1:n
        if norm(j) > norm(l)
            l = j;
        end
    end
    if norm(l) == 0
        ind = 0;
    else
        if l ~= k
            p1 = eye(n);
            p1(k, k) = 0;
            p1(l, l) = 0;
            p1(l, k) = 1;
            p1(k, l) = 1;
            a = a * p1;
            p = p * p1;
        end
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
        %     norm=zeros(1,n);
        for j = k + 1:n
            norm(j) = 0;
            for i = k + 1:m
                norm(j) = norm(j) + a(i, j)^2;
            end
        end
        k = k + 1;
    end
end
r = 0;
for i = 1:min(m, n)
    if r <= min(m, n)
        if abs(a(r+1, r+1)) > prec
            r = r + 1;
        end
    end
end