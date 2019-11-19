close all
original_image=imread('board.tif');
subplot(321);
imshow(original_image);
title('original_image');

sharpimage=imsharpen(original_image);
subplot(322);
imshow(sharpimage);
title('image after sharpness');

original_image=imread('cell.tif');
subplot(323);
imshow(original_image);
title('original_image');

sharpimage=imsharpen(original_image);
subplot(324);
imshow(sharpimage);
title('image after sharpness');

orignal_image=imread('pout.tif');
subplot(325);
imshow(original_image);
title('original_image');

sharpimage=imsharpen(original_image);
subplot(326);
imshow(sharpimage);
title('image after sharpness');