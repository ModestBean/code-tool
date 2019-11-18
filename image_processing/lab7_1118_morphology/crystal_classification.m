% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191101 �޸��ˣ�YinDou 
% ������ݣ���ɾ������
clc;
close all;
clear;
img = imread('./Data/hight.png'); % ��ȡԭͼ��
figure, imshow(img), title('ԭʼͼ��');
grayimg = rgb2gray(img);
BWimg = grayimg;
[width, height] = size(grayimg);
figure, imshow(grayimg), title('�Ҷ�ͼ��');
% ��ֵ����< 80 ����ɫ >= 80 ����ɫ  
T1 = 80;
for i = 1 : width
    for j = 1 : height
        if(grayimg(i, j) < T1)
            BWimg(i, j) = 255;
        else 
            BWimg(i, j) = 0;
        end
    end
end
figure, imshow(BWimg), title('��ֵ����ͼ��');
% �ȱ����� �ٿ�����
se = strel('disk', 5);
BWimg = imclose(BWimg, se);
BWimg = imopen(BWimg, se);
figure, imshow(BWimg), title('�չ�������ͼ��');
% ͳ�Ʊ�ע��ͨ��
[mark_image, num] = bwlabel(BWimg, 4); 
% �ο�����https://blog.csdn.net/wanrenwangxuejing/article/details/25108191
% bwlabel Ѱ����ͨ����4��ͨ��ָ��������ص�λ���������������ڵ��ϡ��¡�����ң�����Ϊ�����������ŵ�
% num ��ʾ��ͨ����ĸ���
% l�Ǵ�С��BWingһ����ͼ�����飬�������Ŷ�bwingͼ��ı�ǩֵ�����ж�Ϊ��ͨ����L�����б�ǳ�����
% regionprops ����
% �ο� ��https://blog.csdn.net/langb2014/article/details/49886787
% ����ֵSTATS��һ������Ϊmax(L(:))�Ľṹ���飬�ṹ�������Ӧ������ÿһ��������Ӧ�����µĶ���
status = regionprops(mark_image, 'BoundingBox');
centroid = regionprops(mark_image, 'Centroid');
figure;
imshow(mark_image);title('��Ǻ��ͼ��');

all_area = 0; % �����
all_perimeter = 0; % ���ܳ�
for i = 1 : num
    % ���ƴ��������
    rectangle('position', status(i).BoundingBox, 'edgecolor', 'r');
    text(centroid(i, 1).Centroid(1, 1) - 15, centroid(i, 1).Centroid(1, 2) - 15, num2str(i), 'Color', 'r') 
    % �������Ȥ�����ܳ������
    image_part = (mark_image == i);
    area_result = regionprops(image_part, 'Area');
    perimeter_result = regionprops(image_part, 'Perimeter');
    all_area = all_area + area_result.Area;
    all_perimeter = all_perimeter + perimeter_result.Perimeter;
end

fprintf('all_area = %f\n', all_area);
fprintf('all_perimeter = %f\n', all_perimeter);