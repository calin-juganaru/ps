function unu
    
    close all;
    clear all;
    
    K = 9;
    N = 128;
    fs = N;
    
    load('noisy_signal.mat')
    
    figure; plot(noisy_signal);
    
    DFT = zeros(1, N);
    
    M = N / 2;
    
    for k = 1 : M
        for n = 1 : M
            DFT(k)     += noisy_signal(n)     * exp(-j * 2 * pi * k * n / N);
            DFT(N - k) += noisy_signal(N - n) * exp(-j * 2 * pi * k * n / N);
        endfor    
    endfor    
    
    FFT = fft(noisy_signal);
    
    figure; stem(abs(DFT)(1 : N / 2), 'b'); hold on;
    stem(abs(FFT(1 : N / 2)), 'r');
    
    figure; stem(-N / 2 + 1 : N / 2, abs(DFT), 'b'); hold on;
    stem(-N / 2 + 1 : N / 2, abs(FFT), 'r');
    
    % =========================================================================
    
    signal = abs([DFT(N - K  + 1 : N) DFT(1 : K + 1)]);
    noise = abs(DFT); 
    noise(1 : K + 1) = zeros(1, K + 1);
    noise(N - K + 1: N) = zeros(1, K);
    
    signal_power = sum(signal .* signal) / length(signal)
    noise_power  = sum(noise  .* noise)  / length(noise)
    
    ratio = signal_power / noise_power
    ratio = 10 * log10(ratio)
    
    % =========================================================================
    
    FFT(K + 1 : N - K) = zeros(1, N - 2 * K);
    DFT(K + 1 : N - K) = zeros(1, N - 2 * K);
    
    IDFT = zeros(1, N);
    
    for n = 1 : M
        for k = 1 : M
            IDFT(n)     += DFT(k)     * exp(j * 2 * pi * k * n / N);
            IDFT(N - n) += DFT(N - k) * exp(j * 2 * pi * k * n / N);
        endfor    
    endfor 
    
    IDFT = real(IDFT) / N;
    IFFT = real(ifft(FFT));
    
    figure; 
    plot(IDFT, 'b'); hold on;
    plot(IFFT, 'r');
    
endfunction
