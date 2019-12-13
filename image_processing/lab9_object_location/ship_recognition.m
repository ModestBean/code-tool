% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191212 �޸��ˣ�YinDou 
% ������ݣ����ˮ���еĴ�ֻ
clc;
close all;
clear;
origin_image = imread('ship_ocean.jpg');
figure, imshow(origin_image, 'InitialMagnification', 'fit'), title('ԭʼͼ��');
gray_image = rgb2gray(origin_image);
binary_image = imbinarize(gray_image, 0.77);
figure,imshow(binary_image, 'InitialMagnification', 'fit'), title('��ֵ��ͼ��');
% �ȱ����� �ٿ�����
se = strel('disk', 5);
morphology_image = imclose(binary_image, se);
morphology_image = imopen(morphology_image, se);
figure, imshow(morphology_image, 'InitialMagnification', 'fit'), title('��̬ѧͼ��');

