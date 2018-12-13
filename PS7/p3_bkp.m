%% Dual B-Spline Construction

clear;
close all;

% Setup
L = 2;
n = 20;
% h_L = zeros(2*n + 1, 1);
% g_L = zeros(2*n + 1, 1);
freq_res = 2048;
% G_L = zeros(freq_res, 1);
% H_L = zeros(freq_res, 1);

bspline = @bspline2;

%b_fun = @(t, k) bspline(t) .* bspline(t-k);


for nind = 1:floor(L/2) + 2
    g(nind) = integral(@(t) (bspline(t).*bspline(t-(nind-1))), -inf, inf);
end

g_L = [g, g(end:-1:2)];
figure;
stem([-(floor(L/2) + 1):(floor(L/2) + 1)], fftshift(g_L))
title('g_L[n]');

G_L = (fft(g_L, freq_res));
figure;
plot((abs(G_L)));
title('G_L');


H_L = G_L;
figure;
plot(abs(H_L));
title('H_L');
 
h = ifft((H_L), freq_res);
h_L = h(1:2*n+1);
figure;
hold on;
stem(h);
plot(g_L);
hold off;

% 
% figure; 
% g_L = fftshift(g_L);
% plot([-n:n], g_L); hold on;
% h_L = fftshift(h_L);
% stem([-n:n], h_L);