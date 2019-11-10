% @author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @date 20191101
% @description ��ȡRGBͼ�����ص���Ϣ
rgb = imread('onion.png');
figure(1), imshow(rgb);
[n, m, k] = size(rgb);
target_pixel = [255, 200, 0];
background = [200, 200, 250];
w = 64;
every_pixel = zeros(1, 3);
for i = 1 : n
  for j = 1 : m
       every_pixel(1 : 3) = rgb(i, j, 1 : 3);
      if(norm(every_pixel - target_pixel) > w ) 
           rgb(i, j, 1 : 3) = background; 
      end
  end
end
figure(2), imshow(rgb);