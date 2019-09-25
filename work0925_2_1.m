%
% @author 憨豆酒 YinDou
% @date 20190925
% @description 直方图变换

clc;
clear;
original_image = imread('cameraman.tif'); 
% gamma = 1 表示线性变换
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 1);
subplot(3, 2, 1),imshow(original_image); 
subplot(3, 2, 2),imshow(processing_image); 
title('线性变换')
% 作业（1） gamma = 1.5
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 1.5);
subplot(3, 2, 3),imshow(processing_image); 
title('gamma = 1.5')

% 作业（2） gamma = 2
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 2);
subplot(3, 2, 4),imshow(processing_image); 
title('gamma = 2')

% 作业（3） gamma = 2.5
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 2.5);
subplot(3, 2, 5),imshow(processing_image); 
title('gamma = 2.5')

% 作业（4） gamma = 3
processing_image = imadjust(original_image, [0 0.2], [0.5 1], 3);
subplot(3, 2, 6),imshow(processing_image); 
title('gamma = 3')
