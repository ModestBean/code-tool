% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191101 �޸��ˣ�YinDou 
% ������ݣ���ɾ������

clc;
close all;
clear;
img=imread('./Data/hight_1_1.png'); %��ȡԭͼ��
figure;
imshow(img);
grayimg = rgb2gray(img);
BWimg = grayimg;
[width,height]=size(grayimg);
figure;
imshow(grayimg);
%��ֵ��
T1=80;
for i=1:width
    for j=1:height
        if(grayimg(i,j)<T1)
            BWimg(i,j)= 255;
        else 
            BWimg(i,j)= 0;
        end
    end
end
figure;
imshow(BWimg);
%�ȱ����� �ٿ�����
se=strel('disk',5);
BWimg = imclose(BWimg,se);
BWimg = imopen(BWimg,se);
figure;
imshow(BWimg);
%ͳ�Ʊ�ע��ͨ��
%ʹ����Ӿ��ο�ѡ��ͨ�򣬲�ʹ������ȷ����ͨ��λ��
[mark_image,num] = bwlabel(BWimg,4); %�ο�����https://blog.csdn.net/wanrenwangxuejing/article/details/25108191
%bwlabel Ѱ����ͨ����    4��ͨ��ָ��������ص�λ���������������ڵ��ϡ��¡�����ң�����Ϊ�����������ŵ�
%num ��ʾ��ͨ����ĸ���
%l�Ǵ�С��BWingһ����ͼ�����飬�������Ŷ�bwingͼ��ı�ǩֵ�����ж�Ϊ��ͨ����L�����б�ǳ�����
%regionprops ����
%�ο� ��https://blog.csdn.net/langb2014/article/details/49886787
%����ֵSTATS��һ������Ϊmax(L(:))�Ľṹ���飬�ṹ�������Ӧ������ÿһ��������Ӧ�����µĶ���
status=regionprops(mark_image,'BoundingBox');
centroid = regionprops(mark_image,'Centroid');

figure;
imshow(mark_image);title('��Ǻ��ͼ��');
 
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');%�ο�https://blog.csdn.net/zr459927180/article/details/51152094
    %����˵����position���Ƶ�Ϊ��άͼ������ͨ���Խǵ�����ȷ�����ο�
    %edgecolor ָ��Եͼ��r��ʾ�任Ϊ��ɫ��
    %facecolor ָ�ڲ������ɫ��
    text(centroid(i,1).Centroid(1,1)-15,centroid(i,1).Centroid(1,2)-15, num2str(i),'Color', 'r') 
    %�����Ϊ���Ƴ����ľ��ο�ͼ�������
end

copy_mark_image = mark_image;
image_part3 = (copy_mark_image == 1); %%��߽��������ѡ������ֻ����3
figure;
imshow(image_part3);

%�����
round_area = regionprops(image_part3,'Area');
fprintf('round_area = %f\n', round_area.Area);
 
%���ܳ�
girth = regionprops(image_part3,'Perimeter');
% girth.Perimeter
fprintf('s.Perimeter = %f\n', girth.Perimeter);


