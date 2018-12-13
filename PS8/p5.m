%% Signal Reconstruction
% Problem 8.5
%% Setup
clear; 
close all;
load('hw8problem5.mat');
M = length(y);
N = 51;
B = (N-1) / 2;
A = zeros(M, N);
t = [0:0.001:1];
f = zeros(1, length(t));

%% Estimating A
A = sampmat(samptimes, N);

%% Estimating signal
x = pinv(A)*y;
A = sampmat(t, N);
f = A * x;
figure;
hold on;
plot(t, real(f));
plot(samptimes, y, '*-');
legend('reconstructed', 'original');

%% sampmat func
function A = sampmat(samptimes, N)
    samptimes = samptimes(:);
    M = length(samptimes);
    A = zeros(M, N);
    B = (N-1)/2;
    Q = samptimes*(-B:B);

    A = exp(1j*2*pi*Q);
end