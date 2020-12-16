function g = gauss_filter(size, sigma, miu)
    
    g = (1 / (sigma * sqrt(2 * pi))) * ones(1, size);
    aux = 2 * sigma * sigma;
    
    for k = 0 : size - 1
        g(k + 1) *= exp(-((k - miu) ^ 2) / aux);
    endfor
    
endfunction
