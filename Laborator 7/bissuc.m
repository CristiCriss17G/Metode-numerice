function [x, nrit] = bissuc(a, b, prec)
% Metode Bisectiunilor seccesive de rezolvare a unei ecuatii algebrice sau
% trancendente, despre care se stie ca are o Singura Solutie intr-un interval dat [a:b]
    if (f2(a) * f2(b)) <= 0
        if f2(a) == 0
            x = a;
        elseif f2(b) == 0
            x = b;
        else
            nrit = 0;
            while abs(a-b) > prec
                c = (a + b) / 2;
                if f2(c) == 0
                    x = c;
                elseif f2(a) * f2(c) < 0
                    b = c;
                else
                    a = c;
                end
                x = (a + b) / 2;
                nrit = nrit + 1;
            end
        end
    else
        fprintf('In [%6.3f;%6.3f] nu e o singura solutie.\n', a, b);
        x = 20000;
        nrit = 0;
    end
end