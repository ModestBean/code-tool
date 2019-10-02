% @author ������ YinDou yindou97@163.com
% @date 20191001
% @description ��ز��� ʶ����ĸ
clc;
clear;
% ���س�ʼ��Ƭ
I = imread('logo.png'); 
I = rgb2gray(double(I));
[ni,mi]=size(I);
figure(1);imshow(I,'InitialMagnification','fit'); title('Original Image');
J = imread('pattern.png'); 
J = rgb2gray(double(J));
[nj,mj]=size(J);
figure(2); imshow(J,'InitialMagnification','fit'); title('Image');

% �滮��ͬ����С
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
FI=fft2(double(I*255));
FJ=fft2(double(J*255));
CFJ=conj(FJ);
F=FI.*CFJ;
R=ifft2(F);
for i=1:ni
    for j=1:mi
        if(R(i,j)<0) 
            R(i,j)=0;
        end
    end
end
R=R/max(max(R));

% ��ӡѰ�ҽ��
for i=1:m
    for j=1:n
        if(R(i,j)>0.95) 
            k=i;l=j;break;
        end
    end
end
figure(6); plot(R(k,:)),grid;
figure(7); plot(R(:,l)),grid;

figure(10);imshow(I(k:k+nj,l:l+mj));
title('Search Image result');


