function Fout=zigzag(ki,amp,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N).*ki;
A = A.*(1-amp*(abs(x)-floor(abs(x))).*(abs(x')-floor(abs(x'))));
Fout.A=A;
end
