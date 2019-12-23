% gaussian replicate
clear 
close all
original_image=imread('pears.png');
h=fspecial('gaussian',[5 5],5); % return an averaging filter H of HSIZE.
filtered_image=imfilter(original_image,h,'replicate');
figure(1);
imshow(original_image);
figure(2);
imshow(filtered_image);