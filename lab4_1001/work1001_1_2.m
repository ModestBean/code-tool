% @author ������ YinDou yindou97@163.com
% @date 20191002
% @description imagesc�Ļ�ͼ�����������https://www.mathworks.com/help/matlab/ref/imagesc.html#buxkjup-y
x = [5 8];
y = [3 6];
C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
imagesc(x,y,C);colormap(hot);
colorbar;