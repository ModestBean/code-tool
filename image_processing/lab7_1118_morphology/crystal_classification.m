% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191101 修改人：YinDou 
% 完成内容：完成晶体分类

clc;
close all;
clear;
img=imread('./Data/hight_1_1.png'); %读取原图像
figure;
imshow(img);
grayimg = rgb2gray(img);
BWimg = grayimg;
[width,height]=size(grayimg);
figure;
imshow(grayimg);
%二值化
T1=80;
for i=1:width
    for j=1:height
        if(grayimg(i,j)<T1)
            BWimg(i,j)= 255;
        else 
            BWimg(i,j)= 0;
        end
    end
end
figure;
imshow(BWimg);
%先闭运算 再开运算
se=strel('disk',5);
BWimg = imclose(BWimg,se);
BWimg = imopen(BWimg,se);
figure;
imshow(BWimg);
%统计标注连通域
%使用外接矩形框选连通域，并使用形心确定连通域位置
[mark_image,num] = bwlabel(BWimg,4); %参考博客https://blog.csdn.net/wanrenwangxuejing/article/details/25108191
%bwlabel 寻找连通区域，    4连通是指，如果像素的位置在其他像素相邻的上、下、左或右，则认为他们是连接着的
%num 表示连通区域的个数
%l是大小和BWing一样的图像数组，里面存放着对bwing图像的标签值（即判定为连通后，在L矩阵中标记出来）
%regionprops 介绍
%参考 ：https://blog.csdn.net/langb2014/article/details/49886787
%返回值STATS是一个长度为max(L(:))的结构数组，结构数组的相应域定义了每一个区域相应属性下的度量
status=regionprops(mark_image,'BoundingBox');
centroid = regionprops(mark_image,'Centroid');

figure;
imshow(mark_image);title('标记后的图像');
 
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');%参考https://blog.csdn.net/zr459927180/article/details/51152094
    %参数说明：position绘制的为二维图像（他是通过对角的两点确定矩形框）
    %edgecolor 指边缘图像，r表示变换为红色。
    %facecolor 指内部填充颜色。
    text(centroid(i,1).Centroid(1,1)-15,centroid(i,1).Centroid(1,2)-15, num2str(i),'Color', 'r') 
    %这个是为绘制出来的矩形框图标记数字
end

copy_mark_image = mark_image;
image_part3 = (copy_mark_image == 1); %%这边进行区域的选择，例如只保留3
figure;
imshow(image_part3);

%求面积
round_area = regionprops(image_part3,'Area');
fprintf('round_area = %f\n', round_area.Area);
 
%求周长
girth = regionprops(image_part3,'Perimeter');
% girth.Perimeter
fprintf('s.Perimeter = %f\n', girth.Perimeter);


