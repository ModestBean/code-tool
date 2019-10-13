% @author 憨豆酒 YinDou yindou97@163.com
% @date 20191007
% @description 图像去噪
clc
clear all;
close all;
% 低通滤波平滑
II = imread('rect_image.png');
[B,A] = butter(6,0.2,'low');
J = filter(B,A,double(II));
subplot(1,2,1);
imshow(J,[]);
title('低通滤波平滑');
% 中值滤波平滑
J = medfilt2(II);
subplot(1,2,2);
imshow(J,[]);
title('中值滤波平滑');