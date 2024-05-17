function Fout = SphericalAb4(f,xs,ys,Fin)
Fout = Fin;
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
k = Fin.k;
x = linspace(-size/2,size/2,N);
r = sqrt((x'-ys).^2+(x-xs).^2);
R = f/5;
A4 = A.*exp(1i*k*(sqrt((x-xs).^2+(x'-ys).^2).^4)/(2*f^3));
A(r<R) = A4(r<R);
Fout.A = A;


end