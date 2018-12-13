%% Block iDCT 2

function X = iblock_dct2(X_dct)
    N = length(X_dct);
    X = zeros(N, N);
    blocksize = 8;
    numblocks = N / blocksize;
    
%     fun = @(block_struct) idct2(block_struct.data);
%     X = blockproc(X_dct, [blocksize blocksize], fun);

    for i = 0:numblocks - 1
        for j = 0:numblocks - 1
            X(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize) = idct2(X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize));
        end
    end
end