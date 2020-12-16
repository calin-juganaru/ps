function unu

    close all;
    clear all;

    N = 64;
    f = 3000;
    fs = 64000;
    h = [0.1, 0.2, 0.2, 0.2, 0.1];
    ts = 1 / fs;
    t = ts * (0 : N - 1);
    x = sin(2 * pi * f * t);
    M = length(h);
    y = zeros(1, N);

    for n = 1 : N
        i = n;
        for k = M : -1 : 1
            y(n) += h(k) * x(i);
            i -= 1;

            if i == 0
                break;
            endif
        endfor
    endfor

    figure; stem(y);

    x = [0, 0, 0, 0, 1, 0, 0, 0, 0];
    N = length(x);
    y = zeros(1, N);

    for n = 1 : N
        i = n;
        for k = M : -1 : 1
            y(n) += h(k) * x(i);
            i -= 1;

            if i == 0
                break;
            endif
        endfor
    endfor

    figure; stem(conv(h, x));

    x = sin(2 * pi * f * t);
    figure; stem(conv(h, x)(1 : N));

endfunction
