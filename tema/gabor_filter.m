function [complex_h, cos_h, sin_h] = gabor_filter(size, sigma, freq)
    
    t = [0 : size - 1];
    g = gauss_filter(size, sigma, size / 2);
    
    cos_h = g .* cos(2 * pi * freq * t);
    sin_h = g .* sin(2 * pi * freq * t);
    complex_h = g .* exp(j * t);
    
endfunction
