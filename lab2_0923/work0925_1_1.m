%
% @author 憨豆酒 YinDou
% @date 20190925
% @description 图像算数运算

clc;
clear;
original_image=imread('blurry_moon_1.tif'); 

% 加法运算 +30 常用于多张图像计算平均图像
arithmetic_image = imadd(original_image, 30);
subplot(3, 2, 1),imshow(original_image);  
subplot(3, 2, 2),imshow(arithmetic_image);  
title('加')

% 作业（1） Y=x/2 校正成像设备的非线性影响
arithmetic_image = imdivide(original_image, 2);
subplot(3, 2, 3),imshow(arithmetic_image); 
title('除')


% 作业（2） Y=x*2 掩模处理，屏蔽图像的某些部分
arithmetic_image = immultiply(original_image, 2);
subplot(3, 2, 4),imshow(arithmetic_image); 
title('乘')

% 减法运算 -20  检测变化和运动的物体
arithmetic_image = imsubtract(original_image, 20);
subplot(3, 2, 5),imshow(arithmetic_image); 
title('减法')

% 作业（3） Y=2x-50 
arithmetic_image = imsubtract(immultiply(original_image, 2), 50);
subplot(3, 2, 6),imshow(arithmetic_image); 
title('2x-50')



