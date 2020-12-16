function doi
  
    T = 128;
    t = 1 : 1 : T;
    fc = 20 / T;
    a = 0.05;
    s = exp(-a * t);
    DFT = zeros(1, T);
    
    for k = 1 : 1 : T
        for n = 1 : 1 : T
            DFT(k) += s(n) * exp(-j * 2 * pi * k * n / T);
        endfor    
    endfor
  
    subplot(2, 1, 1);
    fx = zeros(1, T);
    findex = T / 2 * linspace(0, 1, T / 2);
    fx((T / 2) + 1 : end) = findex;
    fx(1 : T / 2) = [-T / 2, -findex(end : -1 : 2)];
    fs = fft(s);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients before amplitude modulation');
    hold
    stem(fx, DFT, 'r');
    
    % -------------------------------------------------------------------------
    
    x = zeros(1, T);
    
    for _t = 1 : 1 : T
        x(_t) = (1 + s(_t)) * cos(2 * pi * fc * _t);
    endfor
  
    subplot(2, 1, 2);
    fx = zeros(1, T);
    findex = T / 2 * linspace(0, 1, T / 2);
    fx((T / 2) + 1 : end) = findex;
    fx(1 : T / 2) = [-T / 2, -findex(end : -1 : 2)];
    fs = fft(x);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients before amplitude modulation');
    hold
    stem(fx, DFT, 'r');
  
endfunction
