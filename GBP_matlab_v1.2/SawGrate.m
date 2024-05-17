function Fout=SawGrate(kx,ky,delta,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N);
A=A.*(1-delta*sawtooth(abs(x).*kx).*sawtooth(abs(x').*ky));
Fout.A=A;
end