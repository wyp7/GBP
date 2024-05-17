function out = getBeamWidth(F)
C = Intensity(F);
row = floor(F.N/2);
[val,idx1] = max(C(row,:));
w = val/exp(2);
x = linspace(-F.size/2,F.size/2,F.N);
A = C(row,:)-w;
[~,idx2] = min(abs(A));
out = abs(x(idx1)-x(idx2));
end