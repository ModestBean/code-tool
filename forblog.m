% @author 憨豆酒 YinDou yindou97@163.com
% @date 20191001
% @description Radon变换
clc
clear; 
% 读入图片
I = fitsread('solarspectra.fts');
I = mat2gray(I);
I = imresize(I,[128,128]);   %重置图片大小

p1=figure(1);
BW = edge(I);
theta=0:179;               %radon变换。获得从0到179每个幅角的 
[R,x]=radon(BW,theta);
[M,N]=size(R);
imagesc(theta,x,R);        %显示radon变换结果
colormap(hot); 
title('Radon result'); 
xlabel('theta(幅角)'); 
ylabel('x(幅值)'); 
colorbar

p2=figure(2);
imshow(I);
%findpeaks函数只能对一维向量进行处理，因此对radon变换结果变形
J=reshape(R,M*N,1);                    
[PKS,LOCS]= findpeaks(J,'THRESHOLD',4); %利用峰值检测函数进行峰值检测，可设置阈值阈值因图而异
L=size( LOCS,1);     %检测到的峰值个数，即最终检测出的直线条数
d=zeros(size(LOCS)); %存放检测结果-距离
thetar=zeros(size(LOCS));%存放检测的直线角度

for i=1:L
 d(i)=mod(LOCS(i),185)-(M-1)/2;%实际是距离
 thetar(i)= fix(LOCS(i)/M); %实际是度数
end

%将直线进行呈现，原理参考https://cn.mathworks.com/help/images/detect-lines-using-the-radon-transform.html?searchHighlight=radon%20transform%20peak&s_tid=doc_srchtitle
for i=1:L
 if thetar(i)==0
     x1=64+d(i);
     x2=x1;
     y1=0;
     y2=128;
 else       
     k=tan(thetar(i)*pi/180);
     x0=64;y0=64;
     b=y0-k*x0;
     k2=-1/k;%得到斜率
     flag=0;
     if thetar(i)>90   %大于90度
         flag=1;
     end
     if d(i)<0
         flag=1;
         d(i)=-d(i);
         if thetar(i)>90
            flag=0;
         end             
     end  
     syms x
     f=sqrt((k*x+b-64)^2+(x-64)^2)-d(i);
     x=solve(f,x);
     y=k*x+b;
     if size(x,1)>1
         if flag==1
            p=x(2);%因图而异，需进行适当修改
            q=y(2);
         else
             p=x(1);
             q=y(1);
         end
     else
         p=x;
         q=y;
     end
     b2=q-k2*p;%得到截距
     x1=0;
     y1=k2*x1+b2;
     x2=128;
     y2=k2*x2+b2;
 end
line([x1,x2],128-[y1,y2],'color','r','LineWidth',1);  % 定位直线
end
