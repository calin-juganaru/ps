function img
  
    load('data.mat');
    
    figure(1); image(IR);
    figure(2); image(R2); 
    figure(3); image(R1);
    
    IR = IR - 0.3 * R1;
    IR = IR - 0.3 * R2;
    IR = IR / 0.3;
    
    figure(4); image(IR);
  
endfunction
