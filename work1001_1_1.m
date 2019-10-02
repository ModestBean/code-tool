% @author 憨豆酒 YinDou yindou97@163.com
% @date 20191001
% @description Radon变换
clc;
clear;
I = fitsread('solarspectra.fts');
I = mat2gray(I);
BW = edge(I);
figure,imshow(I);
% theta = 0:179;
% [R, xp] = radon(BW, theta);
% [M, N]=size(R); 

% 进行reshape
x0 = 96.0;
y0 = 83.0;
thetaT = 45.0;
k = tan(thetaT*pi/180.0); 
b = y0-k*x0;
k2 = -1/k;


syms x
f = sqrt((k*x+b-y0)^2+(x-x0)^2);  %求出到中心点距离为d的点
soln  = solve(f == 8,x);
if soln(1)<96
    xT = soln(1);
else
    xT = soln(2);
end

yT = k*xT + b;
b2 = yT-k2 * xT; %得到直线截距
x1 = 0; %任意求出直线上两点，用于画线
y1 = k2*x1+b2;
x2 = 60;
y2 = k2*x2+b2;
hold on
line([x1,x2],[y1,y2],'Color','r','LineWidth',2)


% J=reshape(R, M*N, 1); 
% [PKS,LOCS]= findpeaks(J,'THRESHOLD',23);
% for i = 1:5
%     d = mod(LOCS(i),M)-(M-1)/2;       
%     theta = fix(LOCS(i)/M);
% end