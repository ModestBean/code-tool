% @author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @date 20191101
% @description 提取HSV图像中重点信息
rgb = imread('onion.png');
hsv = rgb2hsv(rgb);
[n, m, k] = size(rgb);
figure(1), imshow(hsv2rgb(hsv));
a = 0.12;
bg = [0.0, 0.0, 0.5];
w = 0.012;
for i = 1 : n
    for j = 1 : m
      v = hsv(i, j, 1);
      if(abs(v - a) > w )
          hsv(i, j, 1 : 3) = bg;
      end
    end
end
figure(2), imshow(hsv2rgb(hsv));