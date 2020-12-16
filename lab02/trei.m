function trei
    
    %t = 0 : 0.01 : pi/2;
    t = [0, pi/6, pi/4, pi/3, pi/2];
    
    s1 = exp(i * t);
    s2 = exp(-i * t);
    
    figure(1);
    plot(s1, 'r'); hold on;
    plot(s2, 'b'); 
    
    ss = (s1 + s2) / 2;
    
    %figure(2);
    plot(real(ss), imag(ss), 'g');
    plot(t, real(ss), 'color', 'black');
    
endfunction
