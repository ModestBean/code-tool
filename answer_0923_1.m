% ��˹ģ�������޸�
clear all
original_image=imread('football.jpg');
h=fspecial('Gaussian',[5,5],5);  %Arbitrary FIR filter������FIR�˲���
figure(1);
imshow(original_image); %��ʾԭʼͼ
figure(2);
image1=imfilter(original_image,h);
imshow(image1);
h1=fspecial('Gaussian',[5,5],30);
figure(3);
image2=imfilter(original_image,h1,'same'); %zero-padding �����
imshow(image2);