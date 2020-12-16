function features = get_features(sounds, fs, method, plot_figs)
    
    M = 12;
    Q = columns(sounds);
    K = 1102;
    freqs = [  0.0027   0.0089   0.0173  0.0284  0.0433  0.0632  0.0898  0.1254  0.1730  0.2365  0.3215 0.4350];
    sigma = [187.2109 140.0663 104.7939 78.4041 58.6599 43.8878 32.8357 24.5668 18.3803 13.7516 10.2886 7.6977];

    % ---------------------------------------------------------------------------------------------
    
    if plot_figs == true 
      
        [complex_h, cos_h, sin_h] = gabor_filter(K, sigma(1), freqs(1));
        
        figure(1);
        subplot(1, 2, 1); plot(cos_h, 'LineWidth', 1.5); title('Gabor filter for cos');
        subplot(1, 2, 2); plot(sin_h, 'LineWidth', 1.5); title('Gabor filter for sin');
        
        figure(2); 
        for i = 1 : M
            [_, _cos_h, __] = gabor_filter(K, sigma(i), freqs(i));
            coefs = abs(fft(_cos_h)(1 : K / 2));
            plot(coefs, 'LineWidth', 1.25); hold on;
        endfor
        title('Spectrum of the Gabor filters');
        
        %figure(3); plot(gauss_filter(100, 20, 50)); title('Gauss filter');
    
    endif
    
    % =============================================================================================
    
    if method == 0
      
        filters = [];
        features = zeros(Q, 2 * M);
        
        for i = 1 : M
          
            [_, cos_h, __] = gabor_filter(K, sigma(i), freqs(i));
            filters = [filters; cos_h];
            
        endfor
        
        for i = 1 : Q
            for j = 1 : M
              
                y = conv(filters(j, :), sounds(:, i));
                [mean stdd] = get_mean_stdd(y / Q);
                features(i, 2 * j - 1) = mean;
                features(i, 2 * j)     = stdd;
                
            endfor
        endfor
    
    % =============================================================================================
    
    else
    
        N = rows(sounds);
        S = ceil(K / 2.5);
        
        complex_filters = [];
        cos_filters = [];
        sin_filters = [];
        features = zeros(Q, 2 * M);
        
        for i = 1 : M
          
            [complex_h, cos_h, sin_h] = gabor_filter(K, sigma(i), freqs(i));
            complex_filters = [complex_filters; complex_h];
            cos_filters = [cos_filters; cos_h];
            sin_filters = [sin_filters; sin_h];
            
        endfor
    
        % -----------------------------------------------------------------------------------------
        
        #F = 0; for window = 1 : S + K : N - K; F += 1; endfor
        #Oc = zeros(M, F); Os = Oc; Oe = Oc;

        for i = 1 : Q 
            i
            #oc = []; os = []; oe = [];
            
            for j = 1 : M
               
                aux_s = [];% aux_s = []; aux_e = [];
                
                for window = 1 : S + K : N - K
                  
                    sound = sounds(window : window + K, i);
     
                    aux = conv(cos_filters(j, :), sound, 'same');
                    #aux_c = [aux_c (sum(aux) / K)];
                    
                    aux = conv(sin_filters(j, :), aux, 'same');
                    aux_s = [aux_s (sum(aux) / K)];
                    
                    #aux = conv(complex_filters(j, :), sound, 'same');
                    #aux_e = [aux_e (abs(sum(aux) / K))];
                    
                endfor
                
                [mean stdd] = get_mean_stdd(aux_s);
                features(i, 2 * j - 1) = mean;
                features(i, 2 * j)     = stdd;
                
                #oc = [oc; aux_c]; os = [os; aux_s]; oe = [oe; aux_e];
                
            endfor
            
            #Oc += oc; Os += os; Oe += oe;
            
        endfor
        
        % -----------------------------------------------------------------------------------------
        
        #Oc /= Q; Os /= Q; Oe /= Q;
        #o = sqrt(Oc .* Oc + Os .* Os) - Oe;
        #E = rows(o) * columns(o);
        #printf('Difference: %0.10f\n', norm(o, 'fro') / E);
        
    endif
 
endfunction