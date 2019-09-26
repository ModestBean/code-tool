%
% @author ������ YinDou
% @date 20190925
% @description ͼ������,����ϸ��

clc;
clear;
original_image=imread('blurry_moon_1.tif'); 
subplot(5, 2, 1),imshow(original_image);  
subplot(5, 2, 2),imhist(original_image); 

% ��ͨ��ʽ�任
arithmetic_image = imsubtract(immultiply(original_image, 2), 50);
subplot(5, 2, 3),imshow(arithmetic_image); 
subplot(5, 2, 4),imhist(arithmetic_image); 
title('2x-50')

% gamma = 1 ��ʾ���Ա任
processing_image = imadjust(original_image, [0.08 0.4], [0 1], 1);
subplot(5, 2, 5),imshow(processing_image); 
subplot(5, 2, 6),imhist(processing_image); 

% �ع� Complementing only dark pixels 
comp_dark_pixels = processing_image >128;
subplot(5, 2, 7),imshow(comp_dark_pixels); 
subplot(5, 2, 8),imhist(comp_dark_pixels); 

% gamma = 1.5 �����Ա任
processing_image = imadjust(original_image, [0.08 0.4], [0 1], 1.5);
subplot(5, 2, 9),imshow(processing_image); 
subplot(5, 2, 10),imhist(processing_image); 
