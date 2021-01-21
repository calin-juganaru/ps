function doi
    
    close all; clear all;
    
    img = imread('stego_img.bmp');
    S = log(abs(fft2(img)));
    figure; imagesc(S);
    
    S = S([101 : 340], [101 : 420]);
    figure; imagesc(S);

    S -= min(min(S));
    S /= max(max(S));

    figure; imshow(S);
  
endfunction