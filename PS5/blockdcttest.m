%% Block DCT Test

X = im2double(imread('bb.tiff'));

% Block DCT
Xdct = block_dct2(X);
imshow(Xdct);
title('Block DCT');

% Block iDCT
figure;
X_rec = iblock_dct2(Xdct);
imshow(X_rec);
title('Block iDCT');