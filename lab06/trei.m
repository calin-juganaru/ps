function trei
    
    N_analog = 5000;
    N_digital = N_analog / 100;
    
    t_analog = linspace(0, 5, N_analog);
    t_digital = linspace(0, 5, N_digital);
    
    sin_analog = sin(2 * pi * t_analog);
    sin_digital = sin(2 * pi * t_digital);
    
    figure(1);
    plot(t_analog, sin_analog, 'r', 'LineWidth', 1.75); hold on;
    plot(t_digital, sin_digital, 'b', 'LineWidth', 1.25); hold on;
    
    signal = [];
    for i = 1 : 100 : N_analog
        signal = [signal sin_analog(i) zeros(1, 99)];
    endfor
    
    plot(t_analog, signal, 'g', 'LineWidth', 1.25); hold on;
    
    N_sinc = N_analog;
    t_sinc = linspace(-0.2, 0.2, N_sinc / 10);
    sincvec = sinc(10 * t_sinc);
    s_cont_filtered = conv(sin_analog, sincvec);
    s_cont_filtered /= max(s_cont_filtered);
    
    %figure(2);
    x = 5 * [1 : length(s_cont_filtered)] / length(s_cont_filtered);
    plot(x, s_cont_filtered, 'color', 'yellow', 'LineWidth', 2.5);
    
endfunction
