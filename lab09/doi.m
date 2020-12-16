function doi
    
    clear all;
    close all;
    
    N = 256;
    hk = zeros(1, N);
    t = linspace(0, 1, N);
    
    hk(1 : N / 16) = ones(1, 1 : N / 16);
    hk(15 * N / 16 : N) = ones(1, 1 : N / 16);
    plot(t, hk);    
    
    HK = ifftshift(ifft(hk));
    
    figure; plot(abs(HK));
    
    L = length(HK) / 2;
    x = [L - 32 : L + 32];
    
    figure; plot(abs(HK(x)));
    
    y = abs(fft(HK(x)));
    figure; plot(linspace(0, 1, 65), y);
    
    z = HK(x) .* blackman(65)';
    z = abs(fft(z));
    figure; plot(linspace(0, 1, 65), z);
    
    % =========================================================================
    
    N = 64;
    f = 3000;
    fs = 64000;
    ts = 1 / fs; 
    t = ts * (0 : N - 1);
    x = sin(2 * pi * f * t); 
    
    figure; stem(x); hold on;
    x = conv(x, z);
    stem(x);
    
endfunction
