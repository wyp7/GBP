function Fout = CylAb4(f,xs,Fin)

Fout = Fin;

N = Fin.N;
size = Fin.size;
A = Fin.A;
k = Fin.k;
x = linspace(-size/2,size/2,N);

Fout.A = A.*exp(1i*k*(sqrt((x-xs).^2).^4).*ones(1,N)/(2*f^3));



end