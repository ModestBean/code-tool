% 快速傅里叶变换
clc;
clear;
original_image = zeros(30,30);
original_image(5:24, 13:17) = 1;
subplot(221);
imshow(original_image);  
F=fft2(original_image);     %该函数返回一个矩阵的二维傅里叶变换,使用的是一个快速傅里叶变换算法。
subplot(222);
mesh(fftshift(abs(F)))   % 绘制频谱图
title('频谱图');
F2 = fftshift(log(abs(F))); 
subplot(223);
imshow(F2,[-1 5]);
title('频谱图像');