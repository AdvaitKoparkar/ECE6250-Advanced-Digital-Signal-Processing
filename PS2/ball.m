x = [-3:0.01:3];
y = [-3:0.01:3];

[X, Y] = meshgrid(x, y);

Z = (sqrt(2*X.*X - X.*Y + 2*Y.*Y) <= 1);

imshow(Z)