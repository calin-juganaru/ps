function lab03
    
    T = 100;
    A = 3;
    kmax = 20;
    
    t = [1 : 1 : T];    
    square = [A * ones(1, T / 2) -A * ones(1, T / 2)];
    
    figure(1)
    plot(t, square, "LineWidth", 3);
    title("Original signal s(t)");
    ylabel("Amplitude");
    xlabel("Time");
    ylim([(-A - 1), (A + 1)]);
    
    % -------------------------------------------------------------------------
    
    c = zeros(1, 2 * kmax + 1);
    
    for k = -kmax : 1 : kmax
        aux = exp((-2 * pi * i * (k - 1) / T) * t);
        c(k + kmax + 1) =  (1 / T) * trapz(t, square .* aux); 
    end
    
    figure(2)
    stem(1 : 2 * kmax + 1, abs(c), "LineWidth", 3);
    title("Fourier coefficients");
    ylabel("Magnitude of component");
    xlabel("Frequency component (k)");
    
    % -------------------------------------------------------------------------
    
    s = zeros(1, T);
    
    for _t = 1 : 1 : T
        for _k = -kmax : 1 : kmax 
            s(_t) = s(_t) + c(_k + kmax + 1) * exp(2 * pi * i * _t * _k / T);         
        end
    end
    
    figure(3)
    plot(t, s, "LineWidth", 3);
    title("Reconstructed signal s(t)");
    ylabel("Amplitude");
    xlabel("Time");
    
endfunction
