% @Author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @Description 提取目标颜色值
% @Version1 20191101 修改人：YinDou 
% 完成内容：提取HSV图像中重点信息（存在其他颜色）。
% @Version2 20191105 修改人：YinDou 
% 完成内容：修改变量定义，使程序更加易读。
% @Version3 20191117 修改人：YinDou 
% 完成内容：根据橙色的HSB范围进行过滤其他颜色，相当于对Version1的改进

rgb = imread('onion.png');
hsv = rgb2hsv(rgb);
[n, m, k] = size(rgb);
figure(1), imshow(hsv2rgb(hsv));
target_pixel_H_min = 0.0833; % 目标H通道最小值
target_pixel_H_max = 0.15; % 目标H通道最大值
target_pixel_S_min = 0.4; % 目标S通道最小值
target_pixel_B = 1; % 目标B通道

background = [0.0, 0.0, 0.5];
for i = 1 : n
    for j = 1 : m
      H = hsv(i, j ,1); % 原图H
      S = hsv(i, j, 2); % 原图S
      B = hsv(i, j, 3); % 原图B
      % 过滤掉其他颜色，只保留橙色 橙色B为1，H范围是30~54，S范围为40~100
      if((B ~= target_pixel_B) || (H < target_pixel_H_min) || (H > target_pixel_H_max) || (S < target_pixel_S_min))
          hsv(i, j, 1 : 3) = background;
      end
    end
end
figure(2), imshow(hsv2rgb(hsv));