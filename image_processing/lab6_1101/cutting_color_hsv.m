% @author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @description ��ȡĿ����ɫֵ
% @version1 20191101 �޸��ˣ�YinDou ��ȡHSVͼ�����ص���Ϣ���������ʣ�
% @version2 20191105 �޸��ˣ�YinDou �޸ı������׶�
% @version2 20191117 �޸��ˣ�YinDou ȥ�����ʣ���ȡ��׼ȷ

rgb = imread('onion.png');
hsv = rgb2hsv(rgb);
[n, m, k] = size(rgb);
figure(1), imshow(hsv2rgb(hsv));
target_pixel_H = 0.0833; % Ŀ��Hͨ��
target_pixel_S = 0.4; % Ŀ��Sͨ��
target_pixel_B = 1; % Ŀ��Bͨ��
background = [0.0, 0.0, 0.5];
w = 0.001;
for i = 1 : n
    for j = 1 : m
      H = hsv(i, j, 1); % ԭͼH
      S = hsv(i, j, 2); % ԭͼS
      B = hsv(i, j, 3); % ԭͼB
      if((B ~= 1) || (H < 0.0833) || (H > 0.15) || (S < 0.4))
          hsv(i, j, 1 : 3) = background;
      end
    end
end
figure(2), imshow(hsv2rgb(hsv));