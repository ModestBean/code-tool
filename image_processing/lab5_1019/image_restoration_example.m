% @author ������ YinDou yindou97@163.com https://modestbean.github.io/
% @date 20191019
% @description ʹ��ά���˲�����ͼ���޸�
clear;
close all;
I = im2double(imread('cameraman.tif')); 
noise = 0.1 * randn(size(I));
PSF = fspecial('motion', 21, 11); % �˶�ģ���˲���
blurred = im2double(imfilter(I, PSF, 'circular'));% �����˶�ģ��ͼ��
blurredNosie = im2uint8(blurred + noise);%�˶�ģ��ͼ���������

figure(1), imshow(I,'InitialMagnification','fit'); title('1 Original Image');
figure(2), imshow(blurred,'InitialMagnification','fit'); title('2 Blurred Image');
figure(3), imshow(blurredNosie,'InitialMagnification','fit'); title('3 BlurredNosie Image');

NSR = sum(noise(:).^2)/sum(I(:).^2); % �����źŹ��ʱ�
NP = abs(fftn(noise)).^2;
NPOW = sum(NP(:))/prod(size(noise)); % ����������
NCORR = fftshift(real(ifftn(NP))); % ��������غ���
IP = abs(fftn(I)).^2;
IPOW = sum(IP(:))/prod(size(I)); % ԭͼ������
ICORR = fftshift(real(ifftn(IP))); % ԭͼ����غ���
ICORR1 = ICORR(:, ceil(size(I, 1)/2));
NSR = NPOW/IPOW; % �����źŹ��ʱ�

J1 = deconvwnr(blurredNosie,PSF); % ���θı������������ά���˲�
J2 = deconvwnr(blurredNosie,PSF, NSR);
J3 = deconvwnr(blurredNosie,PSF, NCORR, ICORR);
J4 = deconvwnr(blurredNosie,PSF, NPOW, ICORR1);
figure(4), imshow(J1,'InitialMagnification','fit'); title('4 deconvwnr(blurredNosie,PSF)');
figure(5), imshow(J2,'InitialMagnification','fit'); title('5 deconvwnr(blurredNosie,PSF, NSR)');
figure(6), imshow(J3,'InitialMagnification','fit'); title('6 deconvwnr(blurredNosie,PSF, NCORR, ICORR)');
figure(7), imshow(J4,'InitialMagnification','fit'); title('7 deconvwnr(blurredNosie,PSF, NPOW, ICORR1)');


