% Chenming DU for Digital Image Processing 06.10.2019
% Read grayscale,truecolor and indexed images using functions.
close all
clear all
subplot(331);
C=imread('autumn.tif');  
image(C);

subplot(332);
image1=imread('concordaerial.png');
image(image1); %image函数显示坐标轴。

subplot(333);
image2=imread('greens.jpg');
image(image2);

subplot(334);
image3=imread('fabric.png');
image(image3);

subplot(335);
image4=imread('gantrycrane.png');
imshow(image4);

subplot(336);
image5=imread('liftingbody.png');
imshow(image5); 

subplot(337);
image6=imread('rice.png');
imshow(image6);   %image函数的输入为由RGB三元组组成的一个三维数组。

subplot(338);
image7=imread('snowflakes.png');
imshow(image7);

subplot(339);
image8=imread('moon.tif');
imshow(image8);
% 在显示RGB图像时,image和imshow都可以把矩阵内的数值当做RGB值来显示。
% 只不过imshow以原始尺寸显示,而image会对图像进行适当的缩放。