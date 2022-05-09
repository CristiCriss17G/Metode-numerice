%% sislinb
% qra.mat
echo off;
[m, n] = size(a);
a1 = a;
q = eye(n); %!
for k = 1:n - 2 %!
    sig = 0;
    for i = k + 1:n %!
        sig = sig + a(i, k)^2;
    end
    sig = sign(a(k+1, k)) * sqrt(sig); %!
    v = zeros(1, n); %!
    for i = 1:n %!
        if i <= k %!
            v(i) = 0;
        elseif i == k + 1 %!
            v(i) = sig + a(k+1, k); %!
        else
            v(i) = a(i, k);
        end
    end
    beta = sig * (sig + a(k+1, k)); %!
    q1 = eye(n) - (v' * v) / beta; %!
    a = q1 * a * q1; %!
    q = q * q1; %!
end