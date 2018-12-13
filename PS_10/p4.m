%% PCA
% Problem 10.4
%% Setup
clear;
load('faces.mat');

%% Estimation
X = faces';
mu = mean(X);
[N, ~] = size(X);
R = rank(X);
X = X - mu;
[U, Sigma, V] = svd(X);
U = U(:, 1:R);
Sigma = Sigma(1:R, 1:R);
r = 16;
Q = U(:, 1:r);
Theta = U(:, 1:r)'*X;

%% Part a
Xest = mu + Q*Theta;
plotFaces(Xest', 4,4);
%% Part b
plotFaces((Q*Theta)', 4, 4);

%% Part c
% err = zeros(R, 1);
% for rind = 1:R
%     rind
%     Xr = mu + U(:, 1:rind)*(U(:, 1:rind)'*X);
%     err(rind) = ((norm(Xr-faces', 'fro')) / norm(faces')) * 100;
% end
% plot([1:R], err);