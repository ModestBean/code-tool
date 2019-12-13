% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191212 修改人：YinDou 
% 完成内容：检测水面中的船只
clc;
close all;
clear;
origin_image = imread('ship_ocean.jpg');
figure, imshow(origin_image, 'InitialMagnification', 'fit'), title('原始图像');
gray_image = rgb2gray(origin_image);
binary_image = imbinarize(gray_image, 0.77);
figure,imshow(binary_image, 'InitialMagnification', 'fit'), title('二值化图像');
% 先闭运算 再开运算
se = strel('disk', 5);
morphology_image = imclose(binary_image, se);
morphology_image = imopen(morphology_image, se);
figure, imshow(morphology_image, 'InitialMagnification', 'fit'), title('形态学图像');

