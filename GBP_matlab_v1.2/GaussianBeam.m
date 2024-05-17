function F = GaussianBeam(A0,w0,lambda,xs,ys,tx,ty,z,size,N)
% fprintf('Ratio of beam width to wavelength: %.1f\n',w0/lambda)
% fprintf('Grid points per half wavelength: %.3f\n',N/size*lambda/2)
% fprintf('Grid points per beam width: %.3f\n',N/size*w0)

n = 1;
w = BeamWidth(w0,z,lambda,n);
psi = GouyPhase(w0,z,lambda,n);
R = RadiusOfC(w0,z,lambda,n);
F.k = 2*pi*n/lambda;
F.lambda = lambda;
F.theta_x = tx;
F.theta_y = ty;
F.x_shift = xs;
F.y_shift = ys;
fun = @(x,y) A0*(w0/w)*exp(-(x.^2+y.^2)/w^2).*exp(-1i*(F.k*z+F.k*(x.^2+y.^2)/(2*R)-psi));
% fun = @(x,y) A0*(w0/w)*exp(-(x.^2+y.^2)/w^2).*exp(-1i*(F.k*z));
x = linspace(-size/2,size/2,N);
F.A = fun((x-xs),(x'-ys));
F.size = size;
F.N = N;
end