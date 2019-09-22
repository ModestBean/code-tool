% edge extract 
clear all
close all
original_image=imread('liftingbody.png');
subplot(521);
imshow(original_image);
title('original_image')
edge_image=edge(original_image,'Prewitt',0.16);
subplot(522);
imshow(edge_image);
title('prewitt')

original_image=imread('tire.tif');
subplot(523);
imshow(original_image);
title('original_image')
edge_image=edge(original_image,'Sobel',0.16);
subplot(524);
imshow(edge_image);
title('Sobel')

original_image=imread('spine.tif');
subplot(525);
imshow(original_image);
title('original_image')
edge_image=edge(original_image,'LOG',0.001);
subplot(526);
imshow(edge_image);
title('laplacian')

original_image=imread('eight.tif');
subplot(527);
imshow(original_image);
title('original_image')
edge_image=edge(original_image,'Roberts',0.16);
subplot(528);
imshow(edge_image);
title('Roberts')

original_image=imread('cell.tif');
subplot(529);
imshow(original_image);
title('original_image')
edge_image=edge(original_image,'Canny',0.2);
subplot(5,2,10);
imshow(edge_image);
title('Canny')