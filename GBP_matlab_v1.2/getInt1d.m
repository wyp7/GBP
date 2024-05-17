function  sample=getInt1d(F)
 N=F.N;
 size=F.size;
 sample = Intensity(F);
 sample = sample(floor(N/2)+1,1:N);
end