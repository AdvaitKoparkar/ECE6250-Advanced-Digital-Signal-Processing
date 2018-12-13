%% Power Iterations
% Problem 10.5
clear;

for N = [10, 100, 1000]
    %% Setup
    B = randn(N, N);
    A = B + B';
    [V, L, ~] = eig(A);
    q0 = randn(N, 1);
    q0 = q0 / norm(q0);

    %% Iterations
    qk = q0;
    gammak = qk'*A*qk;
    count = 0;
    while 1
        count = count + 1;
        zk = A*qk;
        qk = zk / norm(zk);
        prevgamma = gammak;
        gammak = qk'*A*qk;
        if abs(gammak-prevgamma) <= eps
            break;
        end
    end
    disp(['For N = ' num2str(N)])
    % Part a
    disp(['Took ' num2str(count) ' iterations for N = ' num2str(N)]);
    disp(['Ratio of Lambda1 / Lambda2 = ' num2str(L(1,1) / L(2,2))]);
    % Part b
    disp(['Eigen Value Estimate = ' num2str(gammak)])
    disp(['MATLAB computed largest Eigen Value = ' num2str(L(1,1))])
    disp(['Error in Estimate = ' num2str(abs(gammak - L(1,1)))]);
end