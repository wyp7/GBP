function R = RadiusOfC(w0,z,lambda,n)
if nargin < 4
    n = 1;
end
zR = RayleighRange(w0,n,lambda);
if z == 0
    R = Inf;
else
    R = z*(1 + (zR/z)^2);
end
end