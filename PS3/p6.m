clear;

phi_k = @(z, k) (z>=0).*z.^(k-1).*exp(-z);
h = @(z) (z >= 0).*1.*(z<1);
t = linspace(0, 20, 200000);
N = 5;


x_phik = @(z, ii) h(z).*phi_k(z, ii);
phik_phik = @(z, ii, jj) phi_k(z, ii).*phi_k(z, jj);

G = -1*ones(N, N);
b = -1*zeros(N, 1);
a = -1*zeros(N, 1);

for ii = 1:N
    
    b(ii) = integral(@(z) x_phik(z, ii), 0, inf);
   
    for jj = 1:N
        G(ii, jj) = integral(@(z) phik_phik(z, ii, jj), 0, inf);
    end
end

a = pinv(G)*b;
h_cap = zeros(size(t));
for ii = 1:N
    h_cap = h_cap + (a(ii).*phi_k(t, ii));
end

figure; hold on;
plot(t, h(t));
plot(t, h_cap);
txt = ['Plot of $$h(t)$$ and $$\hat{h}(t)$$ for $$N$$ = ' int2str(N)];
title(txt,'Interpreter','latex')
y_txt = '$$h(t)$$, $$\hat{h}(t)$$';
ylabel(y_txt, 'Interpreter','latex')
xlabel('t');
xlim([0 20]);
grid on;