% @author 憨豆酒 YinDou yindou97@163.com https://github.com/ModestBean
% @date 20191101
% @description 利用2等级强度切片进行处理
clear;
clc;
itemp = imread('intensity_level_slicing.jpg');%read the image
image = itemp(:,:,1);
rmin = 100;         %decide the min. level of intensity level slicing range
rmax = 180;         %decide the max. level of intensity level slicing range
[r,c]= size(image); % get the dimensions of image
s = zeros(r,c);     % pre allocate a variable to store the result image
for i = 1:r
    for j = 1:c
       % if the current pixel of original image is in the specfied range then make it 0 in the result image
        if (rmin < image(i,j)&& image(i,j) < rmax)
            s(i,j) = 0;
       % otherwise store value 255 in the result image 
        else
            s(i,j) = 255;
        end
    end
end
figure,imshow(uint8(image))  %display original image
figure,imshow(uint8(s))      %display result image