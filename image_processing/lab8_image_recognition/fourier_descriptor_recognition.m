% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191130 修改人：YinDou 
% 完成内容：计算傅里叶描述符，使用傅里叶描述符进行图像识别
clc;
close all;
clear;
BW = imread('Cross1.jpg');
BW = imbinarize(BW);
B = fourierShapeDescriptor(BW);
function B=fourierShapeDescriptor(A,r)

bdry_idx = bwboundaries(A);
idx_x = bdry_idx{1,1}(:,1);
idx_y = bdry_idx{1,1}(:,2);
idx_xn = (idx_x - mean(idx_x))/std(idx_x);
idx_yn = (idx_y - mean(idx_y))/std(idx_y);
idx = idx_xn + 1i*idx_yn;
N = numel(idx_x);
n = (N/r);
nstart = floor(N/2)-floor(n/2)+1;
nend = floor(N/2)+floor(n/2)+1;
if nend>N
    nend = N;
end
[h,w] = size(A);

fdes = fftshift(fft(idx));
fdes_lp = ifftshift([zeros(nstart-1,1);fdes(nstart:nend);zeros(N-nend,1)]);
fshape_z = ifft(fdes_lp);
fshape_x = real(fshape_z);
fshape_y = imag(fshape_z);
fshape_x = (fshape_x-mean(fshape_x))/std(fshape_x);
fshape_y = (fshape_y-mean(fshape_y))/std(fshape_y);
fshape_x = nearest(mean(idx_x)+fshape_x*std(idx_x));
fshape_y = nearest(mean(idx_y)+fshape_y*std(idx_y));

B = zeros(h,w);
fdes_idx = sub2ind(size(A),fshape_x,fshape_y);
B(fdes_idx) = 1;
end


