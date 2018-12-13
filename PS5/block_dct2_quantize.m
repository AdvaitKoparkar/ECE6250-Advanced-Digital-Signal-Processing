%% Approximate Block DCT 2

function [X_approx, X_dct] = block_dct2_quantize(X)
    N = length(X);
    X_dct = zeros(N, N);
    blocksize = 8;
    numblocks = N / blocksize;
    load('jpeg_Qtable.mat');
    
    num_z = 0;
    
    % DCT
    X_dct = block_dct2(X);
    
    % Quantize
    for i = 0:numblocks-1
        for j = 0:numblocks-1
            X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize) = Q .* round(X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize) ./ Q);
            num_z = num_z + (blocksize * blocksize - nnz(X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize)));
        end
    end
    
    % iDCT
    X_approx = iblock_dct2(X_dct);
    disp(['Number of non-Zero Coeff: ' num2str(1024*1024 - num_z)]);
end