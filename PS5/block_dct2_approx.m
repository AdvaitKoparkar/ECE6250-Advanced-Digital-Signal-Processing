%% Approximate Block DCT 2

function X_approx = block_dct2_approx(X, M)
    N = length(X);
    X_dct = zeros(N, N);
    blocksize = 8;
    numblocks = N / blocksize;
    
    
    % DCT
    X_dct = block_dct2(X);
    
    % Keep M coeff
    for i = 0:numblocks-1
        for j = 0:numblocks-1
            xb = X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize);
            ind_arr = jpgzzind(blocksize, blocksize);
            discard_ind = ind_arr(M+1:end);
            xb(discard_ind) = 0;
            X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize) = xb;
        end
    end
    
    % iDCT
    X_approx = iblock_dct2(X_dct);
    
end