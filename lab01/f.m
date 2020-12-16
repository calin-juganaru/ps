function answ = f
  
    x = [1; 2; 3; 4; 5]
    s = 0;
    
    %for i = 1 : length(x)
    %    s = s + x(i) * x(i);
    %end
    
    s = x' * x;
    
    t = [0 : 0.01 : 1];
    y1 = sin(2 * pi * t);
    y2 = sin(4 * pi * t);
    
    plot(y1, 'g', y2, 'r');
    title("sinusoideeee");
    xlabel('timpul');
    ylabel('amplitudinea');
    grid on;
    legend("unu", "doi");
    
endfunction
