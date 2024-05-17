function Fout = CircScreen(R,xs,ys,Fin)
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
x = linspace(-size/2,size/2,N);
r = sqrt((x'-ys).^2+(x-xs).^2);
A(r<R) = 0;
Fout.A = A;
end