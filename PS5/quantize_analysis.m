%% Compression Analysis

X = double(imread('bb.tiff'));

[X_cap, X_dct] = block_dct2_quantize(X);
n1 = norm(X - X_cap, 'fro');
n0 = norm(X, 'fro');
err = log10((n1*n1) / (n0*n0));
disp([' Error: ' num2str(err)])

% Display Image
imagesc(X_cap);
title('Reconstructed Image After Quantization')

% Parseval's Thm
Q_err = (X) - X_cap;
err1 = norm(Q_err, 'fro')
Xdct_err = block_dct2(X) - X_dct;
err2 = norm(Xdct_err, 'fro')