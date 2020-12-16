function y = S2
    
    N = 20;
    y = zeros(1, N);
    e = y; y(1) = 7;
    
    x = 60 * ones(1, N);
    
    for i = 2 : N
        e(i) = x(i - 1) - y(i - 1);
        y(i) = S1(y(i - 1), e(i));
    end
    
endfunction
