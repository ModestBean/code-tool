I=imread('liftingbody.png');
I0 = I;
subplot(231);
imshow(I);

BW1=edge(I0,'Prewitt',0.16);
subplot(232);
imshow(BW1);
title('prewitt')


BW2=edge(I0,'Sobel',0.16);
subplot(233);
imshow(BW2);
title('Sobel')

BW3=edge(I0,'LOG',0.012);
subplot(234);
imshow(BW3);
title('laplacian');

BW4=edge(I0,'Roberts',0.16);
subplot(235);
imshow(BW4);
title('Roberts')

BW5=edge(I0,'Canny',0.2);
subplot(236);
imshow(BW5);
title('Canny')