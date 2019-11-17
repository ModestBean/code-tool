% @author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @description 提取目标颜色值
% @version1 20191101 修改人：YinDou 提取HSV图像中重点信息（存在杂质）
% @version2 20191105 修改人：YinDou 修改变量，易读
% @version2 20191117 修改人：YinDou 去掉杂质，提取更准确

rgb = imread('onion.png');
hsv = rgb2hsv(rgb);
[n, m, k] = size(rgb);
figure(1), imshow(hsv2rgb(hsv));
target_pixel_H = 0.0833; % 目标H通道
target_pixel_S = 0.4; % 目标S通道
target_pixel_B = 1; % 目标B通道
background = [0.0, 0.0, 0.5];
w = 0.001;
for i = 1 : n
    for j = 1 : m
      H = hsv(i, j, 1); % 原图H
      S = hsv(i, j, 2); % 原图S
      B = hsv(i, j, 3); % 原图B
      if((B ~= 1) || (H < 0.0833) || (H > 0.15) || (S < 0.4))
          hsv(i, j, 1 : 3) = background;
      end
    end
end
figure(2), imshow(hsv2rgb(hsv));