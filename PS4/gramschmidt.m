%% Gram Schmidt Algorithm

%% Loading and initializing variables
clear;
load('hw4problem4.mat')
[N, K] = size(A);
Q = zeros(N, K);
w = zeros(N, 1);

%% Algorithm

% initialize
Q(:, 1) = A(:, 1) / norm(A(:, 1));

% step
for i=2:K
    w = zeros(N, 1);
    sub = zeros(N, 1);
    for j=1:i-1
        sub = sub + Q(:, j)*dot(Q(:, j), A(:, i));
    end
    w = A(:, i) - sub;
    w = w / norm(w);
    Q(:, i) = w;
end

%% Results
rank([A Q])
max(max(abs(eye(50)-Q'*Q)))