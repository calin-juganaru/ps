function doi
    
    fc = 3000;
    N = 64;
    T = 4000;
    
    signal = sin(2 * pi * fc * linspace(0, 1, T));
    
    figure(1);
    fx = zeros(1, T);
    findex = T / 2 * linspace(0, 1, T / 2);
    fx((T / 2) + 1 : end) = findex;
    fx(1 : T / 2) = [-T / 2, -findex(end : -1 : 2)];
    fs = fft(signal);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('FFT');

    % -------------------------------------------------------------------------
    
    figure(2);
    fx = zeros(1, N);
    fidx = (T / N) * linspace(0, N - 1, N);
    spectrum = fft(signal, N);
    stem(fidx, abs(spectrum)); hold on;
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    title('DFT');
    
    
    %figure(3);
    fidx = (T / N) * linspace(-N / 2, N / 2 - 1, N);
    stem(fidx, abs(fftshift(spectrum)), 'r');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    title('Zero-centred frequency spectrum of signal');
  
endfunction
