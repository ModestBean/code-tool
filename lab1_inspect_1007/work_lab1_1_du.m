% Chenming DU for Digital Image Processing 06.10.2019
% Read grayscale,truecolor and indexed images using functions.
close all
clear all
subplot(331);
C=imread('autumn.tif');  
image(C);

subplot(332);
image1=imread('concordaerial.png');
image(image1); %image������ʾ�����ᡣ

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
imshow(image6);   %image����������Ϊ��RGB��Ԫ����ɵ�һ����ά���顣

subplot(338);
image7=imread('snowflakes.png');
imshow(image7);

subplot(339);
image8=imread('moon.tif');
imshow(image8);
% ����ʾRGBͼ��ʱ,image��imshow�����԰Ѿ����ڵ���ֵ����RGBֵ����ʾ��
% ֻ����imshow��ԭʼ�ߴ���ʾ,��image���ͼ������ʵ������š�