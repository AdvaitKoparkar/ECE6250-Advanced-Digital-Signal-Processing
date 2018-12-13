%% Test script for Haar transform

% load('bumps.mat');
load('blocks.mat');

% Plot
plot(c)
title('Input Signal');

figure;
stem(haar(c, 3));
title(['Haar transform'])

% Error
crec = ihaar(haar(c, 3), 3);
err = norm(crec - c', 'fro')

% Parseval's Thm
w = haar(c, 3);
w_err = w;
epsilon = 0.001*randn(1, length(w_err));
w_err = w_err + epsilon;
c_rec = ihaar(w_err, 3);
err_after_transform = norm(c_rec - c', 'fro')^2
err_added = norm(epsilon, 'fro')^2


