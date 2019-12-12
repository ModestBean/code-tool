% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191212 修改人：YinDou 
% 完成内容：检测水面中的船只
clc;
close all;
clear;
BW = imread('ship_ocean.jpg');
figure, imshow(BW), title('原始图像');