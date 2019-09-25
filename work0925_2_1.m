%
% @author ������ YinDou
% @date 20190925
% @description ֱ��ͼ�任

clc;
clear;
original_image = imread('cameraman.tif'); 
% gamma = 1 ��ʾ���Ա任
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 1);
subplot(3, 2, 1),imshow(original_image); 
subplot(3, 2, 2),imshow(processing_image); 
title('���Ա任')
% ��ҵ��1�� gamma = 1.5
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 1.5);
subplot(3, 2, 3),imshow(processing_image); 
title('gamma = 1.5')

% ��ҵ��2�� gamma = 2
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 2);
subplot(3, 2, 4),imshow(processing_image); 
title('gamma = 2')

% ��ҵ��3�� gamma = 2.5
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 2.5);
subplot(3, 2, 5),imshow(processing_image); 
title('gamma = 2.5')

% ��ҵ��4�� gamma = 3
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 3);
subplot(3, 2, 6),imshow(processing_image); 
title('gamma = 3')
