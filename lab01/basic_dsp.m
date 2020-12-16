function basic_dsp
  
    t = [0 : 0.01 : 1];
    
    s1 = sin(2 * pi * t);
    s2 = sin(4 * pi * t);
  
    s3 = s1 + s2;
    
    width = 2.75;

    subplot(3, 1, 1);
    plot(t, s1, 'LineWidth', width), grid on;
    title('s1'); grid on;

    subplot(3, 1, 2);
    plot(t, s2, 'LineWidth', width, 'r'), grid on;
    title('s2'); grid on;

    subplot(3, 1, 3);
    plot(t, s3, 'LineWidth', width, 'g'), grid on;
    title('s1 + s2'); grid on;
  
endfunction
