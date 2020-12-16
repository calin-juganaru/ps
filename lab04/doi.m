function doi

    % -------------------------------------------------------------------------

    A = 1;
    T = 100;
    N = 30;

    fc = 10 / T; %5000;
    R = 1000;
    C = 1 / (2 * pi * R * fc);

    alpha = 2 * pi * j * R * C / T;

    original = A * [ones(1, 20) zeros(1, T - 20)];
    t = [1 : 1 : T];

    c = zeros(1, N);

    for k = 1 : 2 : N
        c(k) = 2 / (k * pi * j);
    end

    figure(1)
    plot(t, original, "LineWidth", 3);
    title("Original signal s(t)");
    ylabel("Amplitude");
    xlabel("Time");
    ylim([-0.1, (A + 0.25)]);

    figure(2)
    stem(1 : N, abs(c));

    % -------------------------------------------------------------------------

    cy = zeros(1, N);

    for k = 1 : 2 : N
        cy(k) = c(k) / (1 + k * alpha);
    end
    
    % -------------------------------------------------------------------------

    sN = zeros(1, T);

    for ii = 1 : T
        for k = 1 : 2 : N
            sN(ii) += 2 * cy(k) * exp(2 * pi * j * k * ii / T);
        end
    end

    figure(3)
    plot(t, real(sN), "LineWidth", 3);

    % -------------------------------------------------------------------------
end