function [mean, stdd] = get_mean_stdd(vector)
    
    size = length(vector);
    mean = sum(vector) / size;
    stdd = sqrt(sum(abs(vector - mean)) / size);
    
endfunction
