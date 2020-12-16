function doi
    
    close all;
    clear all;
    
    S = load('noisy_sound.mat');
    s = S.noisy_sound;
    fs = S.fs;
    
    FFT = fft(s);
    N = length(FFT);
    K = N / 16;
    
    figure; plot(s, 'b');
    figure; stem(abs(FFT(1 : N / 2))); hold on;
    
    signal = abs([FFT(N - K  + 1 : N) FFT(1 : K + 1)]);
    noise = abs(FFT); 
    noise(1 : K + 1) = zeros(1, K + 1);
    noise(N - K + 1: N) = zeros(1, K);
    
    signal_power = sum(signal .* signal) / length(signal)
    noise_power  = sum(noise  .* noise)  / length(noise)
    
    ratio = signal_power / noise_power
    ratio = 10 * log10(ratio)
    
    FFT(K + 1 : N - K) = zeros(1, N - 2 * K);   
    IFFT = real(ifft(FFT));
    
    figure; plot(IFFT, 'r'); hold on;
    
    sound(IFFT);
    
endfunction