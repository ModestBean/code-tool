% @author ������ YinDou yindou97@163.com
% @date 20191002
% @description radonѰ�ҷ�ֵ
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
% ���ֵ 94.329470608293950 ����Ϊ(49��1)

J=reshape(R,M*N,1); 
[PKS,LOCS]= findpeaks(J,'THRESHOLD',4); 

figure
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar