% @author ������ YinDou
% @date 20190930
% @description �����Զ�������ͼ��
I = imread('cameraman.tif');
% �Ҷ�ͼ�񻮷ֳ�5���ȼ�
X = grayslice(I, 5); 
% ����map����
map = [0,1,1;
    1,0,1;
    1,1,0;
    1,0,0;
    0,1,0];
imshow(X, map);