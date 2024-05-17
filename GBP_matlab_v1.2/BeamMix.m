function Fout = BeamMix(F1,F2)
if F1.lambda ~= F2.lambda
    error('Wavelengths must be the same for both fields.')
elseif F1.N ~= F2.N
    error('N must be the same for both fields.')
elseif F1.size ~= F2.size
    error('Grid size must be the same for both fields.')
elseif F1.k ~= F2.k
    error('Wavenumber k must be the same for both fields.')
end

Fout.k = F1.k;
Fout.N = F1.N;
Fout.size = F1.size;
Fout.lambda = F1.lambda;
Fout.A = F1.A + F2.A;
end