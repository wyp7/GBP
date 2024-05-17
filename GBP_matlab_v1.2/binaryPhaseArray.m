function Fout = binaryPhaseArray(kx,delta,duty,F)
Fout=F;
A=F.A;
size=F.size;
N=F.N;
x = linspace(-size/2,size/2,N);

frecuency = kx; %or other frecuency
Fout.A = A.*exp(1i*delta*(square((frecuency*x).*ones(1,N),duty)+1));

end