% @author ������ YinDou yindou97@163.com
% @date 20191001
% @description Radon�任
clc
clear; 
% ����ͼƬ
I = fitsread('solarspectra.fts');
I = mat2gray(I);
I = imresize(I,[128,128]);   %����ͼƬ��С

p1=figure(1);
BW = edge(I);
theta=0:179;               %radon�任����ô�0��179ÿ�����ǵ� 
[R,x]=radon(BW,theta);
[M,N]=size(R);
imagesc(theta,x,R);        %��ʾradon�任���
colormap(hot); 
title('Radon result'); 
xlabel('theta(����)'); 
ylabel('x(��ֵ)'); 
colorbar

p2=figure(2);
imshow(I);
%findpeaks����ֻ�ܶ�һά�������д�����˶�radon�任�������
J=reshape(R,M*N,1);                    
[PKS,LOCS]= findpeaks(J,'THRESHOLD',4); %���÷�ֵ��⺯�����з�ֵ��⣬��������ֵ��ֵ��ͼ����
L=size( LOCS,1);     %��⵽�ķ�ֵ�����������ռ�����ֱ������
d=zeros(size(LOCS)); %��ż����-����
thetar=zeros(size(LOCS));%��ż���ֱ�߽Ƕ�

for i=1:L
 d(i)=mod(LOCS(i),185)-(M-1)/2;%ʵ���Ǿ���
 thetar(i)= fix(LOCS(i)/M); %ʵ���Ƕ���
end

%��ֱ�߽��г��֣�ԭ��ο�https://cn.mathworks.com/help/images/detect-lines-using-the-radon-transform.html?searchHighlight=radon%20transform%20peak&s_tid=doc_srchtitle
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
     k2=-1/k;%�õ�б��
     flag=0;
     if thetar(i)>90   %����90��
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
            p=x(2);%��ͼ���죬������ʵ��޸�
            q=y(2);
         else
             p=x(1);
             q=y(1);
         end
     else
         p=x;
         q=y;
     end
     b2=q-k2*p;%�õ��ؾ�
     x1=0;
     y1=k2*x1+b2;
     x2=128;
     y2=k2*x2+b2;
 end
line([x1,x2],128-[y1,y2],'color','r','LineWidth',1);  % ��λֱ��
end
