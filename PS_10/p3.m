%% Total Least Squares
% Problem 10.3
%% Setup
clear;
A = [2 4 -1; 1 -2 1; 4 0 1; 5 6 -1; 8 -4 2];
y = [1; 2; -1; -2; 5];

%% TLS Solution
C = [A y];
R = rank(C);

r = R - 1;
[W, Gamma, Z] = svd(C);
Gamma = Gamma(1:R, 1:R);
W = W(:, 1:R);
Z = Z(:, 1:R);
Xcap = W(:, 1:end-1)*Gamma(1:end-1, 1:end-1)*Z(:, 1:end-1)';
delta = W(:, end)*Gamma(end, end)*Z(:, end)';
%% Part a
xtls = (-1.0/(Z(end:end))) * Z(1:end-1:end)
%% Part b
residual_err = norm(delta, 'fro')^2;
deltaA = delta(:, 1:end-1)
deltay = delta(:, end)