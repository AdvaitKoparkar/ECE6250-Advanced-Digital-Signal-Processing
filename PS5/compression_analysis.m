%% Compression Analysis

X = double(imread('bb.tiff'));
M = 1:64;
err = zeros(1, length(M));

for mind = 1:length(M)
    X_cap = block_dct2_approx(X, M(mind));
    n1 = norm(X - X_cap, 'fro');
    n0 = norm(X, 'fro');
    err(mind) = log10((n1*n1) / (n0*n0));
    % disp(['M = ', num2str(M(mind)), ' Error: ' num2str(err(mind))])
end

plot(M, err);
title('Log Error of Approximation');

figure;
appxM1 = imagesc(block_dct2_approx(X, 1))
title('Approximation with M = 1')
figure;
appxM3 = imagesc(block_dct2_approx(X, 3))
title('Approximation with M = 3')
figure;
appxM8 = imagesc(block_dct2_approx(X, 8))
title('Approximation with M = 8')