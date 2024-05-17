function Fout = Zernike(n,m,Delta,Fin)%R,Delta,Fin)
if mod(n - abs(m),2) ~= 0
    error('n-|m| must be even')
elseif abs(m)>n
    error('|m|<=n')
end
Fout = Fin;
N = Fin.N;
size = Fin.size;
A = Fin.A;
k = Fin.k;
x = linspace(-size/2,size/2,N);
if m == 0
    deltam0 = 1;
else
    deltam0 = 0;
end
rho = @(x,y) sqrt((x.^2 + y.^2));%/R^2);
theta = @(x,y) atan2(y,x) + pi;
Vnms = @(p,s) ( ( (  (-1)^s)*factorial(n-s)  )/(  factorial(s)*factorial((n+abs(m))/2-s)*factorial( (n-abs(m))/2 -s)  )  )*p.^(n-2*s) ;
Vnm = (zeros(N,N));
for s = 0:(n-abs(m))/2
    Vnm = Vnm + Vnms(rho(x,x'),s);
end
if m >= 0
    Znm = @(t) Delta*sqrt((2*(n+1))/(1+deltam0))*Vnm.*cos(abs(m)*t);
elseif m < 0
    Znm = @(t) Delta*sqrt((2*(n+1))/(1+deltam0))*Vnm.*sin(abs(m)*t);
end
phi = @(x,y) 1i*k*Znm(theta(x,y));
Fout.A = exp(phi(x,x')).*A;
end
