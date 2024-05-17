function Fout=IntGrateX(kx,delta,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N);
Fout.A=A.*(1-delta*(1-cos(x.*kx+pi).*ones(1,N)));
end