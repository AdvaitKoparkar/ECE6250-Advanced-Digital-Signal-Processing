phi = @(z) exp(-z.^2);
t = linspace(0, 1, 1000);
figure(1); clf
hold on
N = 4;

%% PART 1
% for kk = 1:N
% plot(t, phi(N*t - kk + 1/2))
% end
% title(['Showing basis \Phi_k(t) for N = ' int2str(N)]);
% xlabel('t');
% ylabel('\Phi_k(t)');

%% PART 2
% figure; 
% a = [1 -1 1 -1];
% t = linspace(0,1,1000);
% y = zeros(size(t));
% for jj = 1:N
% y = y + a(jj)*phi(N*t - jj + 1/2);
% end
% txt = '$$y(t) = \sum a_k \Phi(t)$$';
% title(txt,'Interpreter','latex')
% xlabel('t');
% ylabel('y(t)');
% plot(t, y)
%% PART 3
x = @(z) (z < 1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);

