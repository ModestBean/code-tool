% @author 憨豆酒 YinDou
% @date 20190930
% @description 创建自定义索引图像
I = imread('cameraman.tif');
% 灰度图像划分成5个等级
X = grayslice(I, 5); 
% 创建map矩阵
map = [0,1,1;
    1,0,1;
    1,1,0;
    1,0,0;
    0,1,0];
imshow(X, map);