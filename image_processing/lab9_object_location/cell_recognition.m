% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191215 �޸��ˣ�YinDou 
% ������ݣ�����ͼ��ָ���ȡϸ��
clc;
close all;
clear;
origin_image = imread('cell.tif');
figure, imshow(origin_image, 'InitialMagnification', 'fit'), title('ԭʼͼ��');
[junk, threshold] = edge(origin_image, 'sobel');
fudgeFactor = .5;
BWs = edge(origin_image, 'sobel', threshold * fudgeFactor); % �ı��������Ե
figure, imshow(BWs, 'InitialMagnification', 'fit'), title('��Ե��ȡͼ��');
se90 = strel('line',3 ,90); % ��ֱ���ԽṹԪ��
se0 = strel('line', 3, 0); % ˮƽ���ԽṹԪ��
BWsdil = imdilate(BWs, [se90, se0]); % ��ͼ���������
figure, imshow(BWsdil, 'InitialMagnification', 'fit'), title('����ͼ��');
BWdfill = imfill(BWsdil, 'holes'); % ��ͼ�����
figure, imshow(BWdfill, 'InitialMagnification', 'fit'), title('����ͼ��');
BWnobord = imclearborder(BWdfill, 4); % ȥ���߽���ϸ��
figure, imshow(BWnobord, 'InitialMagnification', 'fit'), title('ȥ���߽�ϸ��ͼ��');

seD = strel('diamond', 1); % �������νṹ
BWfinal = imerode(BWnobord, seD); % ��ʴͼ��
BWfinal = imerode(BWfinal, seD); % ��ʴͼ��
figure, imshow(BWfinal, 'InitialMagnification', 'fit'), title('��ʾ��ʴͼ��');
BWoutline = bwperim(BWfinal); % ȡ��ϸ���߽�
Segout = origin_image;
Segout(BWoutline) = 255; % ϸ���߽紦��255
figure, imshow(Segout, 'InitialMagnification', 'fit'), title('���ս��')

