function tictoc
  
    N = 1000;
    A = rand(N, N);
    B = rand(N, N);
    
    tic
    aux = 0;
    for j = 1 : N
        for i = 1 : N
            aux = aux + A(i, j) * B(i, j);
        endfor
    endfor
    toc
    
    tic
    aux = 0;
    for i = 1 : N
        for j = 1 : N
            aux = aux + A(i, j) * B(i, j);
        endfor
    endfor
    toc
    
    tic
    aux = A .* B;
    toc
  
endfunction
