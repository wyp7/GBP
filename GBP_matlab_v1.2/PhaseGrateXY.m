function Fout=PhaseGrateXY(kx,delta,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N);
Fout.A=A.*exp(1i*delta*cos(x.*kx).*cos(x'.*kx));
end