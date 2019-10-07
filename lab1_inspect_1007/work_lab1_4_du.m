% Chenming DU for Digital Image Processing Date:06.10.2019
% Converse image of GrayScale format to Indexed format using MATLAB maps.
close all
clear all
I=imread('liftingbody.png');
subplot(2,2,1);
Image=grayslice(I,100);  %can only be useful for grayscale images.
imshow(Image,parula);
subplot(2,2,2);
imshow(Image,winter);
subplot(2,2,3);
imshow(Image,lines);
subplot(2,2,4);
imshow(Image,flag);