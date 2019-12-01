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
img_stack = cell(7);
for i = 1 : 7
    image_name = strcat(num2str(i),'.png');
    img_stack{i} = imread(strcat('./Data/MiddleQuality/[2]1/', image_name));
end
img = imread('./Data/hight.png'); % 读取原图像
figure, imshow(img_stack{2}), title('原始图像');

% grayimg = rgb2gray(img);
% BWimg = grayimg;
% [width, height] = size(grayimg);
% figure, imshow(grayimg), title('灰度图像');
% crystal_length = length(grayimg(grayimg ~= 255)); % 获取晶体总像素点个数
% % 二值化，< 80 纯白色 >= 80 纯黑色  
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
% figure, imshow(BWimg), title('二值化后图像');
% % 先闭运算 再开运算
% se = strel('disk', 5);
% BWimg = imclose(BWimg, se);
% BWimg = imopen(BWimg, se);
% figure, imshow(BWimg), title('闭关运算后的图像');
% crystal__no_light_length = length(BWimg(BWimg == 255)); % 获取发光像素点个数
% % 统计标注连通域
% [mark_image, num] = bwlabel(BWimg, 4); 
% status = regionprops(mark_image, 'BoundingBox');
% centroid = regionprops(mark_image, 'Centroid');
% figure;
% imshow(mark_image);title('标记后的图像');
% 
% all_area = 0; % 总面积
% all_perimeter = 0; % 总周长
% for i = 1 : num
%     % 绘制窗体和数字
%     rectangle('position', status(i).BoundingBox, 'edgecolor', 'r');
%     text(centroid(i, 1).Centroid(1, 1), centroid(i, 1).Centroid(1, 2), num2str(i), 'Color', 'r') 
%     % 计算感兴趣区域周长和面积
%     image_part = (mark_image == i);
%     area_result = regionprops(image_part, 'Area');
%     perimeter_result = regionprops(image_part, 'Perimeter');
%     all_area = all_area + area_result.Area;
%     all_perimeter = all_perimeter + perimeter_result.Perimeter;
% end
% % 计算发光比值
% proportion = ((crystal_length - crystal__no_light_length) / crystal_length) * 100;
% 
% fprintf('all_proportion = %f%%\n', proportion);
% fprintf('all_area = %f\n', all_area);
% fprintf('all_perimeter = %f\n', all_perimeter);