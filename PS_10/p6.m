%% Least Squares Computions
% Problem 10.6
%% Setup
clear;
A = [1000 1001; 1001 1002; 1002 1003; 1003 1004; 1004 1005];
b = [2001; 2003; 2005; 2007; 2009];
x_perf = [1; 1];

%% Part a
condition = cond(A)

%% Part b
x_svd = inv(A'*A)*A'*b;

%% Part c
[M, N] = size(A);
[Q, R] = qr(A);
invR1 = inv(R(1:N, 1:N));
x_qr = invR1*(Q(:, 1:N)'*b);

%% Part d
L = chol(A'*A);
invA = inv(L) * inv(L');
x_chol = invA*A'*b;

%% Part e
x_mldivide = A\b;

%% Part f
svd_err = norm(x_perf - x_svd)
qr_err = norm(x_perf - x_qr)
chol_err = norm(x_perf - x_chol)
mldivide_err = norm(x_perf - x_mldivide)