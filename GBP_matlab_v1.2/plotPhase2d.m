function [phase_unwrap]=plotPhase2d(F)
N = F.N;
Size = F.size;
    phase_wrap = angle(F.A);
    
       psi=exp(1i*phase_wrap);
      edx = [zeros([size(psi,1),1]), wrapToPi(diff(psi, 1, 2)), zeros([size(psi,1),1])];
      edy = [zeros([1,size(psi,2)]); wrapToPi(diff(psi, 1, 1)); zeros([1,size(psi,2)])];
       lap = diff(edx, 1, 2) + diff(edy, 1, 1); %calculate Laplacian using the finite difference
        rho=imag(conj(psi).*lap);   % calculate right hand side of Eq.(4) in the manuscript
   phase_unwrap = solvePoisson(rho); 
   imagesc(phase_unwrap)
   colorbar
axis image
title('phase')
xticks(linspace(1,N,11))
xticklabels(linspace(-Size*1e3/2,Size*1e3/2,11))
xtickangle(90)
xlabel('x (mm)')
yticks(linspace(1,N,11))
yticklabels(linspace(-Size*1e3/2,Size*1e3/2,11))
ylabel('y (mm)')

end

function phi = solvePoisson(rho)
    % solve the poisson equation using DCT
    dctRho = dct2(rho);
    [N, M] = size(rho);
    [I, J] = meshgrid([0:M-1], [0:N-1]);
    dctPhi = dctRho ./ 2 ./ (cos(pi*I/M) + cos(pi*J/N) - 2);
    dctPhi(1,1) = 0; % handling the inf/nan value
    % now invert to get the result
    phi = idct2(dctPhi);
end
