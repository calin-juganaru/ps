function unu
  
    T = 1;% / 200;
    
    A1 = 1; A2 = 1;
    f1 = 16; f2 = 18;
    
    t = [0 : 0.001 : T];
    
    s1 = A1 * sin(2 * pi * f1 * t);
    s2 = A2 * sin(2 * pi * f2 * t);
  
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
