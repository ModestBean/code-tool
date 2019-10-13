% @author 憨豆酒 YinDou yindou97@163.com
% @date 20191002
% @description radon直线检测
clc
clear all;
close all;
I = fitsread('solarspectra.fts');
I = mat2gray(I);
[height, width ] = size (I);
figure,imshow(I);
BW = edge(I);
theta = 1:180;
[R,xp] = radon(BW,theta);
[M,N]=size(R);
% 最大值 94.329470608293950 索引为(49，1)
J=reshape(R,M*N,1);

% 寻找最大值的索引
sort_J = sort(J, 'descend');
max_value = sort_J(1);
[row,col] = find(R == max_value);

max_line_theta = col;
max_line_distance = row - 129;


% 直线斜率
k = tan(max_line_theta*pi/180.0); 
k2 = -1.0/k;
% 原点
x0 = 0.0;
y0 = 0.0;
width_half = width / 2.0;
height_half = height / 2.0;

syms x % 定义变量x
d = sqrt((k*x-y0)^2+(x-x0)^2); 
soln  = solve(d == abs(max_line_distance),x);
if soln(1)<=0
    xT = soln(1);
else
    xT = soln(2);
end
yT = k*xT;
y1 = 0.0;
x1 = (height_half - y1 - yT)/k2 + xT + width_half;
y2 = 165.0;
x2 = (height_half - y2 - yT)/k2 + xT + width_half;
hold on;
line([x1, x2],[y1,y2],'color','r','LineWidth',1);  % 定位直线

figure
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar