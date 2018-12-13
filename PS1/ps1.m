% N = 100;
% M = 5;
% f = zeros(1, N + 1);
% 
% for i = 1:N
%     f(i) = (sin(i*pi/M) / (i*pi/M));
% 
% end
% 
% stem(f)

x = -3*pi:0.1:3*pi;
stem(x,sinc(x*pi/5))
title('Q 1.7.1 with M = 5')
xlabel('n')
ylabel('h[n]')