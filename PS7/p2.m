%% Estimating A, B
% Problem 7.1
%% Setup
Omega = @(omega) ((2*pi) ^ (0.25)) * exp(-1*(omega^2) / 4);
K = 10;
w = -pi:0.0001:pi;
Omega_f = zeros(1, length(w));

%% Estimation
for wind = 1:length(w)
    Omega_sum = 0;
    for k = -K:K
        Omega_sum = Omega_sum + Omega(w(wind) + 2*pi*k)^2;
    end
    Omega_f(wind) = Omega_sum;
%     Omega_f(wind) = Omega(w(wind));
end

%% Results
A = min(Omega_f)
B = max(Omega_f)

plot(w, Omega_f);
title('$$\sum_{k=-\infty}^{\infty} \Phi(j(\Omega + 2 \pi k))$$ vs $$\Omega$$', 'Interpreter', 'latex');
ylabel('$$\sum_{k=-\infty}^{\infty} \Phi(j(\Omega + 2 \pi k))$$', 'Interpreter', 'latex');
xlabel('$$\Omega$$', 'Interpreter', 'latex');