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


% ��ȡ��ͬͶӰ����ͼ��
img_stack = cell(7);
input_path =  './Data/LowQuality/[0]5/'; % �洢ͼ���·��
%input_path =  './Data/MiddleQuality/[2]5/'; % �洢ͼ���·��
%input_path =  './Data/HightQuality/[5]1/'; % �洢ͼ���·��
file_ext = '*.png'; % ����ȡͼ��ĺ�׺��
%��ȡ����·��
files = dir(fullfile(input_path,file_ext)); 
len = size(files,1);
%����·����ÿһ��ͼ��
low_num = 0;
middle_num = 0;
height_num = 0;
for i=1:len
   filename = strcat(input_path,files(i).name); 
   img_stack{i} = imread(filename);
   one_direction_proportion = calculate_proportion(img_stack{i});
   if one_direction_proportion <= 15
       low_num = low_num + 1;
   elseif one_direction_proportion <= 40
       middle_num = middle_num + 1;
   elseif one_direction_proportion <= 80
       height_num = height_num + 1;
   end
   fprintf('one_direction_proportion = %f%%\n', one_direction_proportion);
end
% ��ӡ��ǰˮ��Ʒ��
if low_num >= 4
    fprintf('��ǰΪ�͵ȼ�ˮ��%d', low_num);
elseif middle_num >=4
    fprintf('��ǰΪ�еȼ�ˮ��%d', middle_num);
elseif height_num >=4
    fprintf('��ǰΪ�ߵȼ�ˮ��%d', height_num);
end



% ����ÿ��ͶӰ����ͼ�񷢹�ȵķ���
% input��ԭʼͼ��
% output��ͼ�񷢹��
function one_direction_proportion = calculate_proportion(img)
    gray_img = rgb2gray(img);
    BWimg = gray_img;
    [width, height] = size(gray_img);
    % ��ȡ���������ص����
    crystal_length = length(gray_img(gray_img ~= 255)); 
    % ��ֵ��
    T1 = 55;
    for i = 1 : width
        for j = 1 : height
            if(gray_img(i, j) < T1)
                BWimg(i, j) = 255;
            else 
                BWimg(i, j) = 0;
            end
        end
    end
    % �ȱ����� �ٿ�����
    se = strel('disk', 5);
    BWimg = imclose(BWimg, se);
    BWimg = imopen(BWimg, se);
    % ��ȡ���������ص����
    crystal__no_light_length = length(BWimg(BWimg == 255)); 
    one_direction_proportion = ((crystal_length - crystal__no_light_length) / crystal_length) * 100;
end