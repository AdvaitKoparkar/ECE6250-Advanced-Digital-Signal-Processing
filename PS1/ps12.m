B = 7;
M = 2/(2*B + 1);
%  f=0;
%  t=linspace(-5,5, 1000);
%  figure;
%  hold on;
%  for i=0:B
%      f=f+(2*cos(i*(2*pi)*t));
%  end
%  
%  f = f * M;
%  title('Q 1.7.2 with B=7')
 
%  plot(t,f)

lim = 3*pi;
x = -lim:0.005:lim;
plot(x,(2/(2*B+1))*sin((B+0.5)*2*pi*x) ./ sin(pi*x))
title('Q 1.7.2 for B = 7')
xlabel('t')
ylabel('x(t)')
xlim([-lim, lim]);