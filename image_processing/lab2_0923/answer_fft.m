% ���ٸ���Ҷ�任
clc;
clear;
original_image = zeros(30,30);
original_image(5:24, 13:17) = 1;
subplot(221);
imshow(original_image);  
F=fft2(original_image);     %�ú�������һ������Ķ�ά����Ҷ�任,ʹ�õ���һ�����ٸ���Ҷ�任�㷨��
subplot(222);
mesh(fftshift(abs(F)))   % ����Ƶ��ͼ
title('Ƶ��ͼ');
F2 = fftshift(log(abs(F))); 
subplot(223);
imshow(F2,[-1 5]);
title('Ƶ��ͼ��');