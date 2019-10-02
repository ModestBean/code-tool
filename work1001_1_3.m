% @author 憨豆酒 YinDou yindou97@163.com
% @date 20191002
% @description radon寻找峰值
clc
clear;
close;
I = fitsread('solarspectra.fts');
I = mat2gray(I);
figure
imshow(I)
title('Original Image')
BW = edge(I);
figure
imshow(BW)
title('Edges of Original Image')
theta = 1:180;
[R,xp] = radon(BW,theta);
[M,N]=size(R);
% 最大值 94.329470608293950 索引为(49，1)

J=reshape(R,M*N,1); 
[PKS,LOCS]= findpeaks(J,'THRESHOLD',4); 

figure
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar