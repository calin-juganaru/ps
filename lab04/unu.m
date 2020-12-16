function unu

    % -------------------------------------------------------------------------

    A = 1;
    T = 100;
    N = 500;

    original = A * [ones(1, T / 2) -ones(1, T / 2)];
    t = [1 : 1 : T];

    c = zeros(1, N);

    for k = 1 : 2 : N
        c(k) = 2 * A / (k * pi * j);
    end

    figure(1)
    plot(t, original, "LineWidth", 3);
    title("Original signal s(t)");
    ylabel("Amplitude");
    xlabel("Time");
    ylim([(-A - 0.25), (A + 0.25)]);

    figure(2)
    c2 = abs(c) .* abs(c);
    stem(1 : N, c2);

    % -------------------------------------------------------------------------

    s = original; s = s.* s;
    P = (1 / T) * trapz(t, s);
    rms = zeros(1, N);

    for i = 1 : N
        sum = 0;
        for k = 1 : 2 : N
            sum += c2(k);
        end

        rms(i) = sqrt(P - 2 * sum);
    end

    figure(3)
    plot(1 : N, rms);

    % -------------------------------------------------------------------------

    sN = zeros(1, T);

    for ii = 1 : T
        for k = 1 : 1 : 500
            sN(ii) += 2 * c(k) * exp(2 * pi * j * k * ii / T);
        end
    end

    figure(4)
    plot(t, sN, "LineWidth", 3);

    % -------------------------------------------------------------------------

end