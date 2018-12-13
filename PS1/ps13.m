B = 15;
N = 101;
M = N/(2*B + 1);
% f=M;
% n=linspace(-2*N, 2*N);
% figure;
% hold on;
%  for k=1:B
%      f=f+2*M*(cos(k*(2*pi)*n/N));
%  end
%  
%  f = f * M;
%  
%  plot(n,f)

lim = 7*pi;
x = -lim:lim;
stem(x,(N/(2*B+1))*sin((B+0.5)*2*pi*x/N) ./ sin(pi*x/N))
title('Q 1.7.3 for B = 15 and N = 101')
xlabel('n');
ylabel('x[n]')
xlim([-lim, lim]);