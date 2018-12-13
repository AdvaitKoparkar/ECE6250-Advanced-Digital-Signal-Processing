%% Block DCT 2

function X_dct = block_dct2(X)
    N = length(X);
    X_dct = zeros(N, N);
    blocksize = 8;
    numblocks = N / blocksize;
    
%     fun = @(block_struct) dct2(block_struct.data);
%     X_dct = blockproc(X, [blocksize blocksize], fun);
    
    for i = 0:numblocks - 1
        for j = 0:numblocks - 1
            X_dct(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize) = dct2(X(i*blocksize + 1:i*blocksize+blocksize, j*blocksize + 1:j*blocksize+blocksize));
        end
    end
end