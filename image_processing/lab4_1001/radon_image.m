% @author ������ YinDou yindou97@163.com
% @date 20191002
% @description radonֱ�߼�� 
% �������Ķ����ڲ��ͣ�
% ����ʵ�ֵ�Ϊ���һ��ֱ�ߣ�����ʵ�ּ�����ֱ�ߣ���Ҫ���������ֵ
clc
clear all;
close all;

% ��ȡԭʼͼ��
I = fitsread('solarspectra.fts');
I = mat2gray(I);
figure(1),imshow(I);
BW = edge(I);
[height, width ] = size (I);
width_half = width / 2.0;
height_half = height / 2.0;

% ִ��radon����
theta = 1:180;
[R,xp] = radon(BW,theta);
[M,N]=size(R);
% reshape��ά����R���任��һά����
J=reshape(R,M*N,1);


% Ѱ�����ֵ������
% J���򣬵���
sort_J = sort(J, 'descend');
% ȡ����J�����ֵ
% ����ʵ�ֵ�Ϊ���һ��ֱ�ߣ�����ʵ�ּ�����ֱ�ߣ���Ҫ����ڶ���ֵ��������ֵ����.....
max_value = sort_J(1);
% �õ��ھ����������������е�����
[row,col] = find(R == max_value);

% �����������任��theta��distance���������
max_line_theta = col;
max_line_distance = row - 129;


% k��ͼ�����ĵ�ֱ��б�ʣ�k2Ϊ���ֱ��б��
k = tan(max_line_theta*pi/180.0);
k2 = -1.0/k;
% ����ϵԭ��
x0 = 0.0;
y0 = 0.0;

% ��������ֱ�߽���
% �������x
syms x 
d = sqrt((k*x-y0)^2+(x-x0)^2);
soln  = solve(d == abs(max_line_distance),x);
% radon�ķ�ֵ��ͼ����࣬�����жϡ� ��ͬ��ͼ��ע�����֣�����ʹ�ô˴���ǵ��޸�
if soln(1)<=0
    xT = soln(1);
else
    xT = soln(2);
end
yT = k*xT;

% ����ֱ����ͼ�����µĽ��㣬�漰��ͼ������ϵ�任����������ͣ�
y1 = 0.0;
x1 = (height_half - y1 - yT)/k2 + xT + width_half;
y2 = 165.0;
x2 = (height_half - y2 - yT)/k2 + xT + width_half;
hold on;
% ����ֱ��
line([x1, x2],[y1,y2],'color','r','LineWidth',1); 

% ����randonͼ
figure(2)
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar