% @Author ������ YinDou yindou97@163.com https://github.com/ModestBean
% @Description ��ȡĿ����ɫֵ
% @Version1 20191101 �޸��ˣ�YinDou 
% ������ݣ���ȡHSVͼ�����ص���Ϣ������������ɫ����
% @Version2 20191105 �޸��ˣ�YinDou 
% ������ݣ��޸ı������壬ʹ��������׶���
% @Version3 20191117 �޸��ˣ�YinDou 
% ������ݣ����ݳ�ɫ��HSB��Χ���й���������ɫ���൱�ڶ�Version1�ĸĽ�

rgb = imread('onion.png');
hsv = rgb2hsv(rgb);
[n, m, k] = size(rgb);
figure(1), imshow(hsv2rgb(hsv));
target_pixel_H_min = 0.0833; % Ŀ��Hͨ����Сֵ
target_pixel_H_max = 0.15; % Ŀ��Hͨ�����ֵ
target_pixel_S_min = 0.4; % Ŀ��Sͨ����Сֵ
target_pixel_B = 1; % Ŀ��Bͨ��

background = [0.0, 0.0, 0.5];
for i = 1 : n
    for j = 1 : m
      H = hsv(i, j ,1); % ԭͼH
      S = hsv(i, j, 2); % ԭͼS
      B = hsv(i, j, 3); % ԭͼB
      % ���˵�������ɫ��ֻ������ɫ ��ɫBΪ1��H��Χ��30~54��S��ΧΪ40~100
      if((B ~= target_pixel_B) || (H < target_pixel_H_min) || (H > target_pixel_H_max) || (S < target_pixel_S_min))
          hsv(i, j, 1 : 3) = background;
      end
    end
end
figure(2), imshow(hsv2rgb(hsv));