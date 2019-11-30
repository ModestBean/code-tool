% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191130 修改人：YinDou 
% 完成内容：计算图像链码，使用图像签名进行图像识别
clc;
close all;
clear;
BW = imread('Cross1.jpg');
BW = imbinarize(BW);
figure, imshow(BW), title('原始图像');
s = size (BW);
% 寻找左上角第一个像素
is_get_first_pixel = false; % 退出循环标志位
for row = 1 : s(1) 
    for col = 1 : s(2)
        if BW(row, col) == 1
            contour = bwtraceboundary(BW, [row, col], 'W', 8, 5000, 'counterclockwise');
            % 画出边界
            if(~isempty(contour))
                hold on;
                plot(contour( : , 2), contour( : , 1), 'g', 'LineWidth', 2);
                hold on;
                plot(col, row, 'gx', 'LineWidth', 2); % 画出边界起点
            else
                hold on;
                plot(col, row, 'rx', 'LineWidth', 2); % 如果找不到起始点，就标记红色
            end
            is_get_first_pixel = true; % 退出循环标志位
            break;
        end
    end
    if is_get_first_pixel
        break;
    end
end