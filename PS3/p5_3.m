clear;

phi = @(z) exp(-z.^2);
x = @(z) (z < 1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);
t = linspace(0, 1, 1000);
N = 50;


x_phik = @(z, ii) x(z).*phi(N*z - ii + 1/2);
phik_phik = @(z, ii, jj) phi(N*z - ii + 1/2).*phi(N*z - jj + 1/2);

G = -1*ones(N, N);
b = -1*zeros(N, 1);
a = -1*zeros(N, 1);

for ii = 1:N
    
    b(ii) = integral(@(z) x_phik(z, ii), 0, 1);
   
    for jj = 1:N
        G(ii, jj) = integral(@(z) phik_phik(z, ii, jj), 0, 1);
    end
end

a = pinv(G)*b;
x_cap = zeros(size(t));
for ii = 1:N
    x_cap = x_cap + (a(ii).*phi(N*t - ii + 1/2));
end

figure; hold on;
plot(t, x(t));
plot(t, x_cap);
txt = ['Plot of $$x(t)$$ and $$\hat{x}(t)$$ for $$N$$ = ' int2str(N)];
title(txt,'Interpreter','latex')
y_txt = '$$x(t)$$, $$\hat{x}(t)$$';
ylabel(y_txt, 'Interpreter','latex')
xlabel('t');