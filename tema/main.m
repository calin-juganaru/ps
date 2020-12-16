function main
    
    clear all;
    close all;
    
    method    = 1;
    plot_figs = true;
    
    load('data.mat')
    
    alpha = 1 / 10;
    b = size(audio_train)(1) / 2 - alpha * size(audio_train)(1) / 2 + 1;
    e = size(audio_train)(1) / 2 + alpha * size(audio_train)(1) / 2;
    audio_train_small = audio_train(b:e,:);
    b = size(audio_train)(1) / 2 - alpha * size(audio_train)(1) / 2 + 1;
    e = size(audio_train)(1) / 2 + alpha * size(audio_train)(1) / 2;
    audio_test_small = audio_test(b:e,:);

    feat_train = get_features(audio_train_small, fs, method, plot_figs);
    feat_test  = get_features( audio_test_small, fs, method, plot_figs);

    model = train_sc(feat_train, labels_train, 'LDA');
    results_train = test_sc(model, feat_train);
    results_test  = test_sc(model, feat_test);

    acc_train = mean(results_train.classlabel(:) == labels_train(:));
    acc_test  = mean(results_test.classlabel(:) == labels_test(:));

    printf('Accuracy on train: %0.2f\n', acc_train);
    printf(' Accuracy on test: %0.2f\n', acc_test);

    labels_name = ["Dog"; "Rooster"; "Rain" ; "Waves"; "Fire"; "Baby"; "Sneezing"; "Clock"; "Helicopter"; "Chainsow"];
    r = round(rand() * 100);
    sound(audio_test(:, r), fs);
    printf('Clasa corecta: %s\n', labels_name(labels_test(r), :));
    printf('Clasa prezisa: %s\n', labels_name(results_test.classlabel(r), :));
    
    
endfunction
