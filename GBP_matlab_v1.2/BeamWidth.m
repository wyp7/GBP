function w = BeamWidth(w0,z,lambda,n)
if nargin < 4
    n = 1;
end
zR = RayleighRange(w0,n,lambda);
w = w0*sqrt(1+(z/zR)^2);
end