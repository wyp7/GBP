A = ones(3,3);
x = linspace(1,3,3)*0.1;
A(x<2*0.1,:) = 2;