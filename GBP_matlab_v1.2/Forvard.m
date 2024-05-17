function Fout = Forvard(F,z)
fprintf('***BEAM PROPAGATION USING ''Forvard''***\n')
Zc = F.size^2/(F.N*F.lambda);

if z > Zc
    fprintf('WARNING: Forvard can only be used for short propagation distances.\n')
    fprintf('WARNING: Critical propagation distance is %.2f mm. \n',1000*Zc);
    fprintf('WARNING: Use Fresnel instead. \n')
end

M = 2^nextpow2(F.N);
N = F.N;
size = F.size;
A = F.A;
Fout = F;
lambda = F.lambda;
k = F.k;
% w = gausswin(N);
Fs = N/size;
f = Fs/N*linspace(-ceil(N/2),floor(N/2)-1,N);
ab = lambda*f;
H = exp(-1i*k*z*real(sqrt(1-ab.^2-ab'.^2)));
v = M-N;
H = padarray(H,[floor(v/2) floor(v/2)],0);
H = padarray(H,[1 1],0,'post');

u1 = fftshift(fft2(A,M,M));
u2 = (H).*u1;
Fout.A = ifft2(fftshift(u2));
Fout.A = Fout.A(1:N,1:N);
end