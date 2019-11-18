% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191101 修改人：YinDou 
% 完成内容：完成晶体分类
clc;
close all;
clear;
img = imread('./Data/hight.png'); % 读取原图像
figure, imshow(img), title('原始图像');
grayimg = rgb2gray(img);
BWimg = grayimg;
[width, height] = size(grayimg);
figure, imshow(grayimg), title('灰度图像');
% 二值化，< 80 纯白色 >= 80 纯黑色  
T1 = 80;
for i = 1 : width
    for j = 1 : height
        if(grayimg(i, j) < T1)
            BWimg(i, j) = 255;
        else 
            BWimg(i, j) = 0;
        end
    end
end
figure, imshow(BWimg), title('二值化后图像');
% 先闭运算 再开运算
se = strel('disk', 5);
BWimg = imclose(BWimg, se);
BWimg = imopen(BWimg, se);
figure, imshow(BWimg), title('闭关运算后的图像');
% 统计标注连通域
[mark_image, num] = bwlabel(BWimg, 4); 
% 参考博客https://blog.csdn.net/wanrenwangxuejing/article/details/25108191
% bwlabel 寻找连通区域，4连通是指，如果像素的位置在其他像素相邻的上、下、左或右，则认为他们是连接着的
% num 表示连通区域的个数
% l是大小和BWing一样的图像数组，里面存放着对bwing图像的标签值（即判定为连通后，在L矩阵中标记出来）
% regionprops 介绍
% 参考 ：https://blog.csdn.net/langb2014/article/details/49886787
% 返回值STATS是一个长度为max(L(:))的结构数组，结构数组的相应域定义了每一个区域相应属性下的度量
status = regionprops(mark_image, 'BoundingBox');
centroid = regionprops(mark_image, 'Centroid');
figure;
imshow(mark_image);title('标记后的图像');

all_area = 0; % 总面积
all_perimeter = 0; % 总周长
for i = 1 : num
    % 绘制窗体和数字
    rectangle('position', status(i).BoundingBox, 'edgecolor', 'r');
    text(centroid(i, 1).Centroid(1, 1) - 15, centroid(i, 1).Centroid(1, 2) - 15, num2str(i), 'Color', 'r') 
    % 计算感兴趣区域周长和面积
    image_part = (mark_image == i);
    area_result = regionprops(image_part, 'Area');
    perimeter_result = regionprops(image_part, 'Perimeter');
    all_area = all_area + area_result.Area;
    all_perimeter = all_perimeter + perimeter_result.Perimeter;
end

fprintf('all_area = %f\n', all_area);
fprintf('all_perimeter = %f\n', all_perimeter);