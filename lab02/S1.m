function z = S1(y, e)
    
    z = y;
    
    if e > 10
        z = y + 10;
    elseif e > 0
        z = y + 1;
    endif
    
endfunction
