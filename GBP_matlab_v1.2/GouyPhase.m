function psi = GouyPhase(w0,z,lambda,n)
if nargin < 4
    n = 1;
end
zR = RayleighRange(w0,n,lambda);
psi = atan2(z,zR);
end