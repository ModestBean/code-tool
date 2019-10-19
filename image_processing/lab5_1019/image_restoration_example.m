% @author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
% @date 20191019
% @description 使用维纳滤波进行图像修复
clear;
close all;
I = im2double(imread('cameraman.tif')); 
noise = 0.1 * randn(size(I));
PSF = fspecial('motion', 21, 11); % 运动模糊滤波器
blurred = im2double(imfilter(I, PSF, 'circular'));% 产生运动模糊图像
blurredNosie = im2uint8(blurred + noise);%运动模糊图像添加噪声

figure(1), imshow(I,'InitialMagnification','fit'); title('1 Original Image');
figure(2), imshow(blurred,'InitialMagnification','fit'); title('2 Blurred Image');
figure(3), imshow(blurredNosie,'InitialMagnification','fit'); title('3 BlurredNosie Image');

NSR = sum(noise(:).^2)/sum(I(:).^2); % 计算信号功率比
NP = abs(fftn(noise)).^2;
NPOW = sum(NP(:))/prod(size(noise)); % 噪声功率谱
NCORR = fftshift(real(ifftn(NP))); % 噪声自相关函数
IP = abs(fftn(I)).^2;
IPOW = sum(IP(:))/prod(size(I)); % 原图像功率谱
ICORR = fftshift(real(ifftn(IP))); % 原图像相关函数
ICORR1 = ICORR(:, ceil(size(I, 1)/2));
NSR = NPOW/IPOW; % 噪声信号功率比

J1 = deconvwnr(blurredNosie,PSF); % 依次改变各个参数进行维纳滤波
J2 = deconvwnr(blurredNosie,PSF, NSR);
J3 = deconvwnr(blurredNosie,PSF, NCORR, ICORR);
J4 = deconvwnr(blurredNosie,PSF, NPOW, ICORR1);
figure(4), imshow(J1,'InitialMagnification','fit'); title('4 deconvwnr(blurredNosie,PSF)');
figure(5), imshow(J2,'InitialMagnification','fit'); title('5 deconvwnr(blurredNosie,PSF, NSR)');
figure(6), imshow(J3,'InitialMagnification','fit'); title('6 deconvwnr(blurredNosie,PSF, NCORR, ICORR)');
figure(7), imshow(J4,'InitialMagnification','fit'); title('7 deconvwnr(blurredNosie,PSF, NPOW, ICORR1)');


