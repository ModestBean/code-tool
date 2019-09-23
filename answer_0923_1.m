% 高斯模糊代码修改
clear all
close all
original_image=imread('football.jpg');
h=fspecial('Gaussian',[5,5],5);  %Arbitrary FIR filter即任意FIR滤波器
figure(1);
imshow(original_image); %显示原始图
figure(2);
image1=imfilter(original_image,h);
imshow(image1);
h1=fspecial('Gaussian',[5,5],30);
figure(3);
image2=imfilter(original_image,h1,'same'); %zero-padding 零填充
imshow(image2);