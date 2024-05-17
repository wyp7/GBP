function Fout = Fresnel(F,z)
if mod(F.N,2) == 0
    error('For Fresnel to work correctly, please only input a field with odd N')
end
fprintf('***BEAM PROPAGATION USING ''Fresnel''***\n')
Zc = F.size^2/(F.N*F.lambda);

if z < Zc
    fprintf('WARNING: Propagation distance too small. Use Forvard instead.\n')
    fprintf('WARNING: Critical propagation distance is %.2f mm. \n',1000*Zc);
end

w0 = getBeamWidth(F);
g = F.size/w0;
deltar = sqrt(F.lambda^2+g^2*w0^2+2*F.lambda*sqrt(g^2*w0^2+z^2))-g*w0;
if deltar/2 < F.size/F.N
    fprintf('WARNING: some aliasing may occur. \n')
    fprintf('%.2f \n',(F.size/F.N)/(deltar/2))
end

N = F.N;
size = F.size;
A = F.A;
Fout = F;
k = F.k;
% w = hann(2*N-1);
w = ones(2*N-1,1);
% ww = 1/3*[1 repmat([4 2],1,(N-3)/2) 4 1]';
% ww = gausswin(N);

U = zeros(2*N-1,2*N-1);
% U(1:N,1:N) = A(1:N,1:N).*(ww*ww');
U(1:N,1:N) = A(1:N,1:N);

M = 2^nextpow2(2*N-1);
fU = fftshift(fft2(U,M,M));

x = linspace(-size/2,size/2,N);
X = [x(1)-fliplr(x(2:N)),x-x(1)];
delta = abs(x(2)-x(1));
r2 = (X.^2+X'.^2+z^2);

H = (1/(2*pi))*(z.*exp(-1i*k*real(sqrt(r2)))./(r2)).*(1./real(sqrt(r2))+1i*k);
fH = fftshift(fft2((H).*(w*w'),M,M));
S = (ifft2(fftshift(fU.*fH)))*delta^2;
Fout.A = S(N:2*N-1,N:2*N-1);
end