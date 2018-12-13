%% My DCT Test

% DCT Accuracy
x = randn(1, 1000000);
d1 = mydct(x);
d2 = dct(x);
dct_err= norm(d1-d2)

% Inverse DCT Accuracy
y = randn(1, 1000000);
w1 = myidct(y);
w2 = idct(y);
idct_err = norm(w1-w2)

% Perfect Reconstruction
x = randn(1, 1000000);
d1 = mydct(x);
x_rec = myidct(d1);
recon_err = norm(x - x_rec, 'fro')