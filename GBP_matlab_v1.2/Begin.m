function F = Begin(A0,lambda,z,size,N)
%% Generates simple uniform plane wave field 
n = 1;
F.k = 2*pi*n/lambda;
F.lambda = lambda;

F.A =  A0*exp(-1i*F.k*z).*ones(N,N)  ;
F.size = size;
F.N = N;
end