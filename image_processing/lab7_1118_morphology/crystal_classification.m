% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191118 �޸��ˣ�YinDou 
% ������ݣ���ɾ������
% @Version2 20191119 �޸��ˣ�YinDou 
% ������ݣ�ͨ�����������������ص��������еĺ����ڶԾ�����з���
% @Version3 20191201 �޸��ˣ�YinDou 
% ������ݣ���ȡ�������ͶӰ����ˮ���ȼ�����
clc;
close all;
clear;
img_stack = cell(7);
for i = 1 : 7
    image_name = strcat(num2str(i),'.png');
    img_stack{i} = imread(strcat('./Data/MiddleQuality/[2]1/', image_name));
end
img = imread('./Data/hight.png'); % ��ȡԭͼ��
figure, imshow(img_stack{2}), title('ԭʼͼ��');

% grayimg = rgb2gray(img);
% BWimg = grayimg;
% [width, height] = size(grayimg);
% figure, imshow(grayimg), title('�Ҷ�ͼ��');
% crystal_length = length(grayimg(grayimg ~= 255)); % ��ȡ���������ص����
% % ��ֵ����< 80 ����ɫ >= 80 ����ɫ  
% T1 = 80;
% for i = 1 : width
%     for j = 1 : height
%         if(grayimg(i, j) < T1)
%             BWimg(i, j) = 255;
%         else 
%             BWimg(i, j) = 0;
%         end
%     end
% end
% figure, imshow(BWimg), title('��ֵ����ͼ��');
% % �ȱ����� �ٿ�����
% se = strel('disk', 5);
% BWimg = imclose(BWimg, se);
% BWimg = imopen(BWimg, se);
% figure, imshow(BWimg), title('�չ�������ͼ��');
% crystal__no_light_length = length(BWimg(BWimg == 255)); % ��ȡ�������ص����
% % ͳ�Ʊ�ע��ͨ��
% [mark_image, num] = bwlabel(BWimg, 4); 
% status = regionprops(mark_image, 'BoundingBox');
% centroid = regionprops(mark_image, 'Centroid');
% figure;
% imshow(mark_image);title('��Ǻ��ͼ��');
% 
% all_area = 0; % �����
% all_perimeter = 0; % ���ܳ�
% for i = 1 : num
%     % ���ƴ��������
%     rectangle('position', status(i).BoundingBox, 'edgecolor', 'r');
%     text(centroid(i, 1).Centroid(1, 1), centroid(i, 1).Centroid(1, 2), num2str(i), 'Color', 'r') 
%     % �������Ȥ�����ܳ������
%     image_part = (mark_image == i);
%     area_result = regionprops(image_part, 'Area');
%     perimeter_result = regionprops(image_part, 'Perimeter');
%     all_area = all_area + area_result.Area;
%     all_perimeter = all_perimeter + perimeter_result.Perimeter;
% end
% % ���㷢���ֵ
% proportion = ((crystal_length - crystal__no_light_length) / crystal_length) * 100;
% 
% fprintf('all_proportion = %f%%\n', proportion);
% fprintf('all_area = %f\n', all_area);
% fprintf('all_perimeter = %f\n', all_perimeter);