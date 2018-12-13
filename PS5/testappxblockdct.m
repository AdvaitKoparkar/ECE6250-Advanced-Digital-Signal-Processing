%% Test Approx Block DCT

X = im2double(imread('bb.tiff'));
M = 3

X_appx = block_dct2_approx(X, M);
imshow(X_appx);