% @author ������ YinDou yindou97@163.com
% @date 20191002
% @description radon������
clc
clear all;
close all;
I = imread('rect_image.png');

% ͼ��ȥ��
[B,A] = butter(6,0.2,'low');
remove_noise = medfilt2(I);

[height, width ] = size (remove_noise);
figure,imshow(remove_noise);
BW = edge(remove_noise);
theta = 1:180;
[R,xp] = radon(BW,theta);
[M,N]=size(R);
reshape_image=reshape(R,M*N,1);

% Ѱ��ǰ���ֵ����
line_numbers = 4; % ֱ�ߵ�����
sort_R = sort(reshape_image, 'descend');

max_value = sort_R(2);
[row,col] = find(R == max_value);
% max_line_theta = col;
% max_line_distance = row - 208;

max_line_theta = 45;
max_line_distance = 50;

% ֱ��б��
k = tan(max_line_theta*pi/180.0); 
k2 = -1.0/k;
% ԭ��
x0 = 0.0;
y0 = 0.0;
width_half = width / 2.0;
height_half = height / 2.0;
syms x % �������x
d = sqrt((k*x-y0)^2+(x-x0)^2); 
soln  = solve(d == abs(max_line_distance),x);


% for i = 1:2 
%     xT = soln(i);
%     yT = k*xT;
%     y1 = 0.0;
%     x1 = (height_half - y1 - yT)/k2 + xT + width_half;
%     y2 = 291.0;
%     x2 = (height_half - y2 - yT)/k2 + xT + width_half;
%     hold on;
%     line([x1, x2],[y1,y2],'color','r','LineWidth',1);  % ��λֱ��
% end

figure
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar