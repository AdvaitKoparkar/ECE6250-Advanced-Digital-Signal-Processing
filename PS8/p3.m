%% Signal Reconstruction
% Problem 8.3

%% Setup
clear; 
close all;
load('hw8problem3.mat');
M = length(a);
N = 10;
A = zeros(M, N);
t = [0:0.0001:1];
f = zeros(1, length(t));

%% Estimating A
A = intmat(a, b, N);

%% Estimating f
x = pinv(A) * y;
for i = 1:N
    f = f + (x(i) * (t.^(N-i)));
end
figure;
hold on;
plot(t, f);

%% intmat
function A = intmat(a, b, N)
    p = N:-1:1;
    M = length(a);
    A = zeros(M, N);
    for mind = 1:M
        A(mind,:) = (b(mind).^p - a(mind).^p)./p;
    end
end