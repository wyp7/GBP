function Fout = crop(dist,Fin)
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
x = linspace(-size/2,size/2,N);

A(:,x>dist) = 0;
Fout.A = A;

end