function Fout=SawGrateA(kx,ky,delta,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N);
A=A.*(1+delta*sawtooth(x.*kx).*sawtooth(x'.*ky));
Fout.A=A;
end