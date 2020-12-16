function unu
    
    A = 1;
    T = 100;
    signal = A * [ones(1, T / 2) -ones(1, T / 2)];
    K = 81;
    c = zeros(1, 2 * K);
    
    for k = 1 : 2 : 2 * K
        c(k) = (2 * A) / (j * pi * k);
    endfor
    
    % -------------------------------------------------------------------------
    
    figure(1)
    subplot(3, 1, 1);
    stem(1 : 2 * K,  abs(c));
    
    %signal = [zeros(1, T / 4) signal(1 : 3 * T / 4)];
    for k = 1 : 2 : K
        c(k) *= exp(j * 2 * pi * k / 4);
    endfor
    
    subplot(3, 1, 2);
    stem(1 : 2 * K, abs(c));
    
    
    subplot(3, 1, 3);
    stem(1 : 2 * K, rad2deg(angle(c))');
    
    % -------------------------------------------------------------------------
    
    s = zeros(1, T);
    
    for _t = 1 : 1 : T
        for _k = -K : 1 : K - 1
            s(_t) += c(_k + K + 1) * exp(2 * pi * j * _t * _k / T);         
        end
    end
    
    figure(2)
    plot(1 : T, s, "LineWidth", 3);
    title("Reconstructed signal s(t)");
    ylabel("Amplitude");
    xlabel("Time");
    
endfunction