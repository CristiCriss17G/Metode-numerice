%% hessenberg
echo off;
[m, n] = size(a);
a1 = a;
b1 = b; %!
q = eye(n);
z = eye(n); %!
for k = 1:n - 1 %!
    sig = 0;
    for i = k:n %!
        sig = sig + b(i, k)^2;
    end
    sig = sign(b(k, k)) * sqrt(sig); %!
    v = zeros(1, n);
    for i = 1:n
        if i <= k - 1 %!
            v(i) = 0;
        elseif i == k %!
            v(i) = sig + b(k, k); %!
        else
            v(i) = b(i, k); %!
        end
    end
    beta = sig * (sig + b(k, k)); %!
    q1 = eye(n) - (v' * v) / beta;
    a = q1 * a; %!
    b = q1 * b; %!
    q = q1 * q;
end

%% new
for k = 1:n - 2
    for i = n:-1:k + 2
        sig = sign(a(i-1, k)) * sqrt(a(i, k)^2+a(i-1, k)^2);
        %     v = zeros(1, n);
        for j = 1:n
            if j < i - 1
                v(j) = 0;
            elseif j == i - 1
                v(j) = sig + a(i-1, k);
            else
                v(j) = a(j, k);
            end
        end
        beta = sig * (sig + a(i-1, k));
        q1 = eye(n) - (v' * v) / beta;
        a = q1 * a;
        b = q1 * b;
        q = q1 * q;
        sig = sign(b(i, i)) * sqrt(b(i, i)^2+b(i, i-1)^2);
        for j = 1:n
            if j < i - 1
                v(j) = 0;
            elseif j == i - 1
                v(j) = b(i, i-1);
            elseif j == i
                v(j) = sig + b(i, i);
            else
                v(j) = 0;
            end
        end
        beta = sig * (sig + b(i, i));
        z1 = eye(n) - (v' * v) / beta;
        a = a * z1;
        b = b * z1;
        z = z * z1;
    end
end
