function out = Intensity(F,eta)
if nargin < 2
    eta = 377; %Ohms, eta_0, impedance of free space
end
A = gather(F.A);
out = A.*conj(A);%/(2*eta);
% out = F.A.*conj(F.A)/(2*eta);
end