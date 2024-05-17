function Fout=PhaseShearY(theta,F)

% Assume rotation axis goes through the center of the beam

Fout=F;
A=F.A;
size=F.size;
N=F.N;
k = F.k;
x = linspace(-size/2,size/2,N);

Fout.A = A.* exp(1i*x'.*k*theta.*ones(N,1));

end