%% Inverse DCT Implementation

function x = myidct(Xdct)
    Xdct(1) = Xdct(1) * sqrt(2);
    Xdft = [Xdct, 0, -fliplr(Xdct(2:length(Xdct)))] .* exp(-1j * 2 * pi * (length(Xdct) - 0.5) .* [0:((2 * length(Xdct)) - 1)] / (2 * length(Xdct))) .* sqrt(2 * length(Xdct));
    y = ifft(Xdft);
    x = real(fliplr(y(1:length(Xdct))));
end