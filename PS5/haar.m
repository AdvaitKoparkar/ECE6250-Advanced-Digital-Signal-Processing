%% Haar Transform

function w = haar(x, L)
    % setup variables
    tworaisedtoj = length(x);
    w = [];
    s_arr = [];
    d_arr = [];
    J = log2(tworaisedtoj);
    prevd = zeros(1, tworaisedtoj/2);
    prevs = zeros(1, tworaisedtoj/2);

    % initialization
    prevd(1, :) = sqrt(1/2) * (x(1:2:end) - x(2:2:end));
    prevs(1, :) = sqrt(1/2) * (x(1:2:end) + x(2:2:end));
    d_arr = [prevd d_arr];
    s_arr = [prevs s_arr];
    
    % step
    for k = J-1:-1:1
        s = sqrt(1/2) * (prevs(1:2:end) + prevs(2:2:end));
        d = sqrt(1/2) * (prevs(1:2:end) - prevs(2:2:end));
        d_arr = [d d_arr];
        s_arr = [s s_arr];
        prevs = s;
    end
    
    % result
    w = [s_arr(2^(J-L):2^(J-L+1)-1) d_arr(2^(J-L):end)];
end