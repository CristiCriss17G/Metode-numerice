echo off;
n = size(a);
a1 = a;
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