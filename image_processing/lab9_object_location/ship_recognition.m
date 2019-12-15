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
% figure,imshow(gray_image, 'InitialMagnification', 'fit'), title('灰度图像');
% 80 25
% 115 12 更好
binary_image = imextendedmax(gray_image, 115);
% figure,imshow(binary_image, 'InitialMagnification', 'fit'), title('二值图像');
se = strel('disk', 12);
morphology_image = imopen(binary_image, se);
% figure, imshow(morphology_image, 'InitialMagnification', 'fit'), title('形态学图像');
se90 = strel('line', 40 ,90); % 垂直线性结构元素
se0 = strel('line', 30, 0); % 水平线性结构元素
BWsdil = imdilate(morphology_image, [se90, se0]); % 对图像进行膨胀
% figure, imshow(BWsdil, 'InitialMagnification', 'fit'), title('膨胀图像');
[mark_image,num] = bwlabel(BWsdil, 4);
status=regionprops(mark_image,'BoundingBox');
centroid = regionprops(mark_image,'Centroid');
for i=1:num
    rectangle('Position',status(i).BoundingBox,'Edgecolor','r','LineWidth',3);
end

