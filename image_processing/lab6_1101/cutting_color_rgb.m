% @author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @date 20191101
% @description 提取RGB图像中重点信息
rgb = imread('onion.png');
figure(1), imshow(rgb);
[n, m, k] = size(rgb);
a = [255, 200, 0];
bg = [200, 200, 250];
w = 64;
v = zeros(1, 3);
for i = 1 : n
  for j = 1 : m
       v(1 : 3) = rgb(i, j, 1 : 3);
      if(norm(v - a) > w ) 
           rgb(i, j, 1 : 3) = bg; 
      end
  end
end
figure(2), imshow(rgb);