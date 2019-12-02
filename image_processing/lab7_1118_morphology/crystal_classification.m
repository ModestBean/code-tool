% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191118 修改人：YinDou 
% 完成内容：完成晶体分类
% @Version2 20191119 修改人：YinDou 
% 完成内容：通过分析晶体亮度像素点在像素中的含量在对晶体进行分类
% @Version3 20191201 修改人：YinDou 
% 完成内容：读取多个方向投影进行水晶等级计算
clc;
close all;
clear;


% 读取不同投影方向图像
img_stack = cell(7);
input_path =  './Data/LowQuality/[0]5/'; % 存储图像的路径
%input_path =  './Data/MiddleQuality/[2]5/'; % 存储图像的路径
%input_path =  './Data/HightQuality/[5]1/'; % 存储图像的路径
file_ext = '*.png'; % 待读取图像的后缀名
%获取所有路径
files = dir(fullfile(input_path,file_ext)); 
len = size(files,1);
%遍历路径下每一幅图像
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
% 打印当前水晶品质
if low_num >= 4
    fprintf('当前为低等级水晶%d', low_num);
elseif middle_num >=4
    fprintf('当前为中等级水晶%d', middle_num);
elseif height_num >=4
    fprintf('当前为高等级水晶%d', height_num);
end



% 计算每个投影方向图像发光度的方法
% input：原始图像
% output：图像发光度
function one_direction_proportion = calculate_proportion(img)
    gray_img = rgb2gray(img);
    BWimg = gray_img;
    [width, height] = size(gray_img);
    % 获取晶体总像素点个数
    crystal_length = length(gray_img(gray_img ~= 255)); 
    % 二值化
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
    % 先闭运算 再开运算
    se = strel('disk', 5);
    BWimg = imclose(BWimg, se);
    BWimg = imopen(BWimg, se);
    % 获取不发光像素点个数
    crystal__no_light_length = length(BWimg(BWimg == 255)); 
    one_direction_proportion = ((crystal_length - crystal__no_light_length) / crystal_length) * 100;
end