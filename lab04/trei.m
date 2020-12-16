function trei
  
    data = randi(4, 1, 10) - ones(1, 10);
    
    T = 100;
    
    subplot(2, 1, 1)
    stem(data, 'LineWidth', 2.5, 'b');
    
    f1 = 2;
    f2 = 3;
    
    t = [0 : 1 / T : 1];
    signal = [];
  
    for i = 1 : 10
        if data(i) == 0
            signal = [signal zeros(1, T)];
            
        elseif data(i) == 1
            signal = [signal sin(2 * pi * f1 * t)]
            
        elseif data(i) == 2
            signal = [signal sin(2 * pi * f2 * t)]
            
        elseif data(i) == 3
            signal = [signal sin(2 * pi * (f1 + f2) * t)]
        end
    endfor
    
    subplot(2, 1, 2)
    plot(signal, 'LineWidth', 2.5, 'r');
    
endfunction
