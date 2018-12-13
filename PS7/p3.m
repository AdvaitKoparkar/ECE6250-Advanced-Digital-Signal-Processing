%% B-Spline Dual Basis Construction
% Problem 7.3
%% Setup
clear 
close all
L = 4;
N = 20;
W = [-pi:0.0001:pi];
t = [-100:0.0001:100];
h_L = zeros(1, 2*N+1);
h_L_half = zeros(1, N+1);
H_L = zeros(1, length(W));
if L == 1
    b = @(t1) bspline1(t1);
elseif L == 2
    b = @(t1) bspline2(t1);
elseif L == 3
    b = @(t1) bspline3(t1); 
elseif L == 4
    b = @(t1) bspline4(t1);
end

%% Finding h_L
for i = 1:length(W)
    H_L(i) = 1 / G_L(W(i), L);
end

for i = 1:N
    h_L_half(i) = 0;
    % n = i - (N+1);
    h_L_half(i) = sum(H_L .* cos(W*(i-1))); 
    h_L_half(i) = h_L_half(i);
end

subplot(1, 2, 1);
h_L = [fliplr(h_L_half), h_L_half(2:end)];
h_L = h_L / (length(W));
stem([-N:N], h_L);
title(['$$h_L[n]$$'], 'Interpreter', 'latex')

%% Generating dual_b
dual_b = zeros(1, length(t));
for l = 1:length(h_L)
    dual_b = dual_b + h_L(l) .* b(t-(l-(N+1)));
end

% figure;
subplot(1, 2, 2);
plot(t, dual_b)
xlim([-10 10]);
title('$$\widetilde{b_L}(t)$$', 'Interpreter', 'latex');

%% Helper Function for Finding G_L(e^(jw))
% Finding G_L
function Gw = G_L(w, L)
    Gw = 0;
    K = 50;
    for k = -K:K
        Gw = Gw + ((sin((w/2) + pi*k)) / ((w/2) + pi*k)) ^ (2*L + 2);
    end
end
