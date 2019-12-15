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
% figure,imshow(gray_image, 'InitialMagnification', 'fit'), title('�Ҷ�ͼ��');
% 80 25
% 115 12 ����
binary_image = imextendedmax(gray_image, 115);
% figure,imshow(binary_image, 'InitialMagnification', 'fit'), title('��ֵͼ��');
se = strel('disk', 12);
morphology_image = imopen(binary_image, se);
% figure, imshow(morphology_image, 'InitialMagnification', 'fit'), title('��̬ѧͼ��');
se90 = strel('line', 40 ,90); % ��ֱ���ԽṹԪ��
se0 = strel('line', 30, 0); % ˮƽ���ԽṹԪ��
BWsdil = imdilate(morphology_image, [se90, se0]); % ��ͼ���������
% figure, imshow(BWsdil, 'InitialMagnification', 'fit'), title('����ͼ��');
[mark_image,num] = bwlabel(BWsdil, 4);
status=regionprops(mark_image,'BoundingBox');
centroid = regionprops(mark_image,'Centroid');
for i=1:num
    rectangle('Position',status(i).BoundingBox,'Edgecolor','r','LineWidth',3);
end

