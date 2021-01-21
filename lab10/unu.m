function unu

    close all; clear all;
    
    img = double(rgb2gray(imread('pamela.jpg'))) / 255;
    imshow(img);    
    FFT = fft2(img);
    S = abs(FFT);
    
    img1 = abs(ifft2(S));
    img1 -= min(min(img1));
    img1 /= max(max(img1));
    figure;
    imshow(img1);
    
    img2 = abs(ifft2(FFT ./ S));
    img2 -= min(min(img2));
    img2 /= max(max(img2));
    figure;
    imshow(img2);
    
endfunction
