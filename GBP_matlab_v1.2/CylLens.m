function Fout = CylLens(f,xs,Fin)
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
k = Fin.k;
x = linspace(-size/2,size/2,N);
A = A.*exp(1i*k*((x-xs).^2+linspace(1,1,N)'.^2)/(2*f));
%A = A.*(exp(1i*k.*((x-xs)'.^2.*ones(N,1))/(2*f))');
Fout.A = A;

figure;
imagesc(angle(A));
end