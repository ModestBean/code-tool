clc;
clear;
original_image=imread('saturn.png');    
subplot(221);
imshow(original_image);  
fft_image_t = returnFftImage(original_image);
subplot(222);          
imshow(fft_image_t,[]);           

original_image=imread('football.jpg');    
subplot(223);
imshow(original_image);  
fft_image_t = returnFftImage(original_image);
subplot(224);          
imshow(fft_image_t,[]);     

% retrun fft_image 
function [fft_image_t] = returnFftImage(original_image)
original_image=rgb2gray(original_image);         
original_image=im2double(original_image);        
fft_image=fft2(original_image);          
fft_image=fftshift(fft_image);      
fft_image=abs(fft_image);            
fft_image_t=log(fft_image+1);
end