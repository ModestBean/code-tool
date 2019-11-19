% unsharp
clear 
close all
original_image = imread('Westconcordorthophoto.png');
subplot(321);
imshow(original_image)
title('original_image');

unsharp_image = imsharpen(original_image);
subplot(322);
imshow(unsharp_image)
title('unsharp_image');

original_image = imread('Concordorthophoto.png');
subplot(323);
imshow(original_image)
title('original_image');

unsharp_image = imsharpen(original_image);
subplot(324);
imshow(unsharp_image)
title('unsharp_image');

original_image = imread('rice.png');
subplot(325);
imshow(original_image)
title('original_image');

unsharp_image = imsharpen(original_image);
subplot(326);
imshow(unsharp_image)
title('unsharp_image');