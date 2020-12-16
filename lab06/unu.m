function unu
    
    freqs = [1 2 10 20 100];
    N = 128;
    t = 0 : 1 / N : 1;
    
    signals = [];
    for f = freqs
        signals = [signals sin(2 * pi * f * t)];
    endfor
    
    x = (1 : length(freqs) * length(t)) / length(t);
    plot(x, signals, 'b', 'LineWidth', 1.5); hold on;
    
    samples = zeros(1, 5);
    for i = 1 : length(freqs) * length(t) - 5
        average = 0;
        for j = i : i + 5
            average += signals(j);
        endfor
        samples = [samples average / 5];
    endfor
    
    plot(x, samples, 'r', 'LineWidth', 1.5);
    
    figure;
    plot(filter(b, a, signals));
    
endfunction
