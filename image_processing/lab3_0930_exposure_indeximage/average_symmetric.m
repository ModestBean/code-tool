% average symmetric
clear 
close all
original_image=imread('coins.png');
h=fspecial('average',5); % return an averaging filter H of HSIZE.
h1=fspecial('average',10);
filtered_image=imfilter(original_image,h);
figure(1);
imshow(original_image);
figure(2);
imshow(filtered_image);
boundary_replication_image=imfilter(original_image,h1,'symmetric');
figure(3);
imshow(boundary_replication_image);
