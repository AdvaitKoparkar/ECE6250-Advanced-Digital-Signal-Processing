%% Pulse Estimation
% Problem 11.4
%% Setup 
clear;
for K = 2:10
    A = toeplitz([-1; 1; 1; zeros((K), 1)], [-1, zeros(1, K)]);
    A(1:3, 1) = [1; 1; 0];
    % A = A(1:end-1, :);
    A(end-2:end) = [0; -1; 1];
    % A
    m = inv(A' * A);
    disp(["For k = ", num2str(K)]) 
    m = m(end, :)
end