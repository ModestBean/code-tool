original_image = imread('saturn.png');
fft_image=fft2(im2double(original_image)); 
fft_image=fftshift(fft_image); 
fft_image=real(fft_image);
T=log(fft_image+1);
subplot(1,2,1);
imshow(original_image);
title('original_image');

subplot(1,2,2);
imshow(T,[]);
title('fft_image');