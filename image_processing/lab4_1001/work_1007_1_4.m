% @author ������ YinDou yindou97@163.com
% @date 20191007
% @description ͼ��ȥ��
clc
clear all;
close all;
% ��ͨ�˲�ƽ��
II = imread('rect_image.png');
[B,A] = butter(6,0.2,'low');
J = filter(B,A,double(II));
subplot(1,2,1);
imshow(J,[]);
title('��ͨ�˲�ƽ��');
% ��ֵ�˲�ƽ��
J = medfilt2(II);
subplot(1,2,2);
imshow(J,[]);
title('��ֵ�˲�ƽ��');