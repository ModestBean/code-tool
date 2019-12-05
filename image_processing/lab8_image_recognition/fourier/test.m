f = imread('./tron.bmp');
g = rgb2gray(f);
% f = imbinarize(f);
% g = f;
bw = edge(g, 'canny');
bw = bwareaopen(bw, 30);
[border_fft, border_restored, xx, yy] = make_fft_sec(bw, 10);
figure(1), imshow(~bw), title('original');
figure(2), imshow(~bw), hold on;plot((xx), yy, 'ro'), title('reconstructed point(red)');
figure(3), imshow(~border_restored), title('reconstruction figure');