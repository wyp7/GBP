function Fout = cropGrid(newGridSize,F)
% DOUBLE-CHECK CENTERING
    if newGridSize > F.size
        error('New grid size must be smaller than old grid. Use setGridSize for mapping to a larger grid.')
    end
    Fout = F;
    Fs = F.size/F.N;
    c = newGridSize/F.size;
    Fout.N = round(c*F.N);
    if mod(Fout.N,2) == 1
        Fout.N = Fout.N+1;
    end
    cr = (F.N-Fout.N)/2;
    Fout.size = Fs*Fout.N;
    Fout.A = F.A(cr+1:F.N-cr,cr+1:F.N-cr);
end