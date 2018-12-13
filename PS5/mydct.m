%% DCT Implementation

function X_dct = mydct(x)
    y = [x fliplr(x)];
    Y = fft(y);
    X_dct = real(exp(-1i.* pi.*[0:length(x)-1]./(2*length(x))).*Y(1:1:length(x))) ./ (2*sqrt(length(x)));
    X_dct(2:length(x)) = X_dct(2:length(x)) .* sqrt(2);
end