function trei
    
    close all;
    clear all;
    load('notes_signal_long.mat')
    
    N = length(notes_signal);
    
    figure(1);
    subplot(2, 2, 1);
    plot(notes_signal);
    
    subplot(2, 2, 2);
    FFT = abs(fft(notes_signal));
    stem(FFT(1 : length(FFT) / 2));
    
    HN = hanning(N)' .* notes_signal;
    
    subplot(2, 2, 3);
    plot(HN);
    
    FFT = abs(fft(HN));
    subplot(2, 2, 4);
    stem(FFT(1 : length(FFT) / 2));
    
endfunction
