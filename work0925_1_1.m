%
% @author ������ YinDou
% @date 20190925
% @description ͼ����������

clc;
clear;
original_image=imread('blurry_moon_1.tif'); 

% �ӷ����� +30 �����ڶ���ͼ�����ƽ��ͼ��
arithmetic_image = imadd(original_image, 30);
subplot(3, 2, 1),imshow(original_image);  
subplot(3, 2, 2),imshow(arithmetic_image);  
title('��')

% ��ҵ��1�� Y=x/2 У�������豸�ķ�����Ӱ��
arithmetic_image = imdivide(original_image, 2);
subplot(3, 2, 3),imshow(arithmetic_image); 
title('��')


% ��ҵ��2�� Y=x*2 ��ģ��������ͼ���ĳЩ����
arithmetic_image = immultiply(original_image, 2);
subplot(3, 2, 4),imshow(arithmetic_image); 
title('��')

% �������� -20  ���仯���˶�������
arithmetic_image = imsubtract(original_image, 20);
subplot(3, 2, 5),imshow(arithmetic_image); 
title('����')

% ��ҵ��3�� Y=2x-50 
arithmetic_image = imsubtract(immultiply(original_image, 2), 50);
subplot(3, 2, 6),imshow(arithmetic_image); 
title('2x-50')



