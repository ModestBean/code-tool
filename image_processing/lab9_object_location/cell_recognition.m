% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191215 修改人：YinDou 
% 完成内容：利用图像分割提取细胞
clc;
close all;
clear;
origin_image = imread('cell.tif');
figure, imshow(origin_image, 'InitialMagnification', 'fit'), title('原始图像');
[junk, threshold] = edge(origin_image, 'sobel');
fudgeFactor = .5;
BWs = edge(origin_image, 'sobel', threshold * fudgeFactor); % 改变参数检测边缘
figure, imshow(BWs, 'InitialMagnification', 'fit'), title('边缘提取图像');
se90 = strel('line',3 ,90); % 垂直线性结构元素
se0 = strel('line', 3, 0); % 水平线性结构元素
BWsdil = imdilate(BWs, [se90, se0]); % 对图像进行膨胀
figure, imshow(BWsdil, 'InitialMagnification', 'fit'), title('膨胀图像');
BWdfill = imfill(BWsdil, 'holes'); % 对图像填充
figure, imshow(BWdfill, 'InitialMagnification', 'fit'), title('填充后图像');
BWnobord = imclearborder(BWdfill, 4); % 去处边界上细胞
figure, imshow(BWnobord, 'InitialMagnification', 'fit'), title('去除边界细胞图像');

seD = strel('diamond', 1); % 构造菱形结构
BWfinal = imerode(BWnobord, seD); % 腐蚀图像
BWfinal = imerode(BWfinal, seD); % 腐蚀图像
figure, imshow(BWfinal, 'InitialMagnification', 'fit'), title('显示腐蚀图像');
BWoutline = bwperim(BWfinal); % 取得细胞边界
Segout = origin_image;
Segout(BWoutline) = 255; % 细胞边界处置255
figure, imshow(Segout, 'InitialMagnification', 'fit'), title('最终结果')

