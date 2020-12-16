function y = ramp(N)
  
    y = zeros(1, N);
    for t = 1 : N
        y(t) = t - 1;
    end
    
end