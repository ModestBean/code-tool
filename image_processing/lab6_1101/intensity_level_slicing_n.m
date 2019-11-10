% @author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @date 20191101
% @description 利用n等级强度切片进行处理
clear ;
close all;
I = double(rgb2gray(imread('images6.jpg')));
[M, N] = size(I);
I2 = zeros(M, N, 3);                                 %初始化三通道
for x = 1 : M
   for y = 1 : N
      if I(x, y) <= 127                                 % R
          I2(x, y, 1) = 0;
      elseif I(x, y) <= 191
          I2(x, y, 1) = 4 * I(x, y) - 510;
      else
          I2(x, y, 1) = 255;
      end
      if I(x, y) <= 63                                  % G
          I2(x, y, 2) = 4 * I(x, y);
      elseif I(x, y) <= 127
          I2(x, y, 2) = 255;
      elseif I(x, y) <= 191
          I2(x, y, 2) = -4 * I(x, y) + 1020;
      else
          I2(x, y, 2) = 1022 - 4 * I(x, y);
      end
      if I(x, y) <= 63                                 % B
          I2(x, y, 3) = 255;
      elseif I(x, y) <= 127
          I2(x, y, 3) = 510 - 4 * I(x, y);
      else
          I2(x, y, 3) = 0;
      end
   end
end
imshow(uint8(I2));