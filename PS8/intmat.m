function [ A ] = intmat(a, b, N)

a = a(:)';
b = b(:)';

P = N:-1:1;
M = length(a);

A = zeros(M, N);

for mm = 1:M
    A(mm,:) = (b(mm).^P - a(mm).^P)./P;
end


