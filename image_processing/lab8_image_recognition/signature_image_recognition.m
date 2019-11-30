% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191130 �޸��ˣ�YinDou 
% ������ݣ�����ͼ�����룬ʹ��ͼ��ǩ������ͼ��ʶ��
clc;
close all;
clear;
BW = imread('Cross1.jpg');
BW = imbinarize(BW);
figure, imshow(BW), title('ԭʼͼ��');
s = size (BW);
% Ѱ�����Ͻǵ�һ������
is_get_first_pixel = false; % �˳�ѭ����־λ
for row = 1 : s(1) 
    for col = 1 : s(2)
        if BW(row, col) == 1
            contour = bwtraceboundary(BW, [row, col], 'W', 8, 5000, 'counterclockwise');
            % �����߽�
            if(~isempty(contour))
                hold on;
                plot(contour( : , 2), contour( : , 1), 'g', 'LineWidth', 2);
                hold on;
                plot(col, row, 'gx', 'LineWidth', 2); % �����߽����
            else
                hold on;
                plot(col, row, 'rx', 'LineWidth', 2); % ����Ҳ�����ʼ�㣬�ͱ�Ǻ�ɫ
            end
            is_get_first_pixel = true; % �˳�ѭ����־λ
            break;
        end
    end
    if is_get_first_pixel
        break;
    end
end