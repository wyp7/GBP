function Fout = ThinLens(f,xs,ys,Fin)
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
k = Fin.k;
x = linspace(-size/2,size/2,N);
A = A.*exp(1i*k*((x-xs).^2+(x'-ys).^2)/(2*f));
Fout.A = A;
end