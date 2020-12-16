function unu
    
    close all;
    clear all;
    
    N = 8;
    K = 64;
    
    A1 = 1; 
    A2 = 0.5; 
    
    fs = 8000; 
    f1 = 1000; 
    f2 = 2000;
    ts = 1 / fs; 
    
    t = ts * (0 : N - 1);
    s1 = A1 * sin(2 * pi * f1 * t); 
    s2 = A2 * sin(2 * pi * f2 * t);
    s = s1 + s2;
    
    figure(1);
    subplot(1, 2, 1);
    plot(s1, 'r', 'linestyle', '--'); hold on;
    plot(s2, 'b', 'linestyle', '--'); hold on;
    plot(s, 'color', 'black');
    
    subplot(1, 2, 2);
    FFT = abs(fft(s));
    stem(FFT);
    
    % -------------------------------------------------------------------------
    
    figure(2);
    subplot(1, 2, 1);
    plot(s2);
    
    subplot(1, 2, 2);
    FFT2 = abs(fft(s2));
    stem(FFT2);
    
    % -------------------------------------------------------------------------
    
    s2 = A2 * sin(2 * pi * 2500 * t);
    s = s1 + s2;
    
    figure(3);
    subplot(1, 2, 1);
    plot(s1, 'r', 'linestyle', '--'); hold on;
    plot(s2, 'b', 'linestyle', '--'); hold on;
    plot(s, 'color', 'black');
    
    subplot(1, 2, 2);
    FFT = abs(fft(s));
    stem(FFT);
    
    % -------------------------------------------------------------------------
    
    s3 = zeros(1, K);
    s3(1 : N) = s(:);
    
    figure(4);
    subplot(1, 2, 1);
    plot(s3);
    
    subplot(1, 2, 2);
    FFT = abs(fft(s3));
    stem(FFT);
    
    % -------------------------------------------------------------------------
    
    s2 = A2 * sin(2 * pi * f2 * t);
    s = s1 + s2;
    s4 = zeros(1, K);
    s4(1 : N) = s(:);
    
    figure(5);
    subplot(1, 2, 1);
    plot(s4);
    
    subplot(1, 2, 2);
    FFT = abs(fft(s4));
    stem(FFT);
    
endfunction