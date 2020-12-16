function trei
    
    load('lab05_modulated_sound.mat'); 
    T = 1 / Fs;
    t = 1 : T;
    fc = Fs / 8;
    %new = cos(2 * pi * fc * t);
    
    %plot(y0_modulated);
   
    subplot(2, 1, 1);
    fx = zeros(1, T);
    findex = T / 2 * linspace(0, 1, T / 2);
    fx((T / 2) + 1 : end) = findex;
    fx(1 : T / 2) = [-T / 2, -findex(end : -1 : 2)];
    fs = fft(Fs);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients before amplitude modulation');
  
endfunction
