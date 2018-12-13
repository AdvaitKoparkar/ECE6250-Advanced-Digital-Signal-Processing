% sampmat.m

function A = sampmat(samptimes, N)

samptimes = samptimes(:);
M = length(samptimes);
A = zeros(M, N);
B = (N-1)/2;
Q = samptimes*(-B:B);

A = exp(1j*2*pi*Q);