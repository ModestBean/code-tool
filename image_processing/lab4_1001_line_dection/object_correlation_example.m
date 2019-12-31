% @author ������ YinDou yindou97@163.com
% @date 20191002
% @description ��غ͸���Ҷ�任 ��ͼ���ж�ȡͼ��

clc;
clear;
close all;
% ��ȡlogoͼ��
I = imread('logo.png'); 
I = rgb2gray(double(I));
[ni,mi]=size(I);
figure(1);imshow(I,'InitialMagnification','fit'); title('Original Image');
% ��ȡ��ĸͼ��
J = imread('pattern.png'); 
J = rgb2gray(double(J));
[nj,mj]=size(J);
figure(2); imshow(J,'InitialMagnification','fit'); title('Image');

% ������ͼ��涨��ͬһ��С������ԵΪ��ɫ
I(:,mi:mi+mj)=0;
I(ni:ni+nj,:)=0;
figure(3);imshow(I,'InitialMagnification','fit'); title('Original Image');
J(:,mj:mi)=0;
J(nj:ni,:)=0;
J(:,mi:mi+mj)=0;
J(ni:ni+nj,:)=0;
figure(4); imshow(J,'InitialMagnification','fit'); title('Image');
[m,n]=size(I);

% Ѱ����ĸλ��
% ��I��J�ֱ�ִ�и���Ҷ�任
FI=fft2(double(I*255));
FJ=fft2(double(J*255));
% �Ը���ҶJ������ز���
CFJ=conj(FJ);
% ������ҶI����غ�ĸ���ҶJ���
F=FI.*CFJ;
% ����F���渵��Ҷ�任
R=ifft2(F);
% ����Rͼ��ʹС��0�ĵ���0
for i=1:ni
    for j=1:mi
        if(R(i,j)<0) 
            R(i,j)=0;
        end
    end
end
% ���򻯾���R���þ���R��ÿһ��ֵ�������ֵ
% max(max(R))Ϊ����R�����ֵ
% ��һ��max����ÿһ�����ֵ���ڶ���max����ÿһ�����ֵ�е����ֵ
R=R/max(max(R));

% Ѱ�����ĸ��ʵ㣬����¼
for i=1:m
    for j=1:n
        if(R(i,j)>0.95) 
            kx=i;ky=j;break;
        end
    end
end
% ����ͳ��ͼ
figure(6); plot(R(kx,:)),grid;
figure(7); plot(R(:,ky)),grid;

% ��ʾI�е���ĸλ��
figure(10);imshow(I(kx:kx+nj,ky:ky+mj));
title('Search Image result');