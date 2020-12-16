function doi

    N = 200;
    T = 100;  
    
    r = ramp(N); s = r;
    u = ones(1, N);
    
    for i = T + 1 : N
        s(i) = r(i) - r(i - T) - T * u(i - T);
    end
    
    plot([1 : N], s, 'LineWidth', 4, 'color', 'black'), grid on; title('s(i)');
    hold('on'); plot([1 : N], r, 'LineWidth', 3, 'color', 'g');
    
    u = T * [zeros(1, T), u(1 : N - T)];
    hold('on'); plot([1 : N], -u, 'LineWidth', 3, 'color', 'r');
    
    r = -[zeros(1, T), r(1 : N - T)];
    hold('on'); plot([1 : N], r, 'LineWidth', 2, 'color', 'b');
    
    legend('sum', 'r(t)', '-u(t-T)', '-r(t-T)');
    
endfunction
