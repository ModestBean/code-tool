%
% @author º©¶¹¾Æ YinDou
% @date 20190930
% @description Í¼ÏñÆØ¹â

clc;
clear;
original_image=imread('blurry_moon_1.tif'); 
subplot(2, 2, 1),imshow(original_image);  
subplot(2, 2, 2),imhist(original_image);

processing_image = imadjust(original_image, [0.08 0.4], [0 1], 1);
% ´´½¨Í¼Ïñ¾ØÕó
[width, height]=size(processing_image); 
complement_image = processing_image;
for i=1:width 
    for j=1:height 
        if complement_image(i, j) <= 128
            complement_image(i, j) =  255 - processing_image(i, j);
        else 
            complement_image(i, j) = processing_image(i, j);
        end
    end
end

subplot(2, 2, 3),imshow(complement_image); 
subplot(2, 2, 4),imhist(complement_image); 