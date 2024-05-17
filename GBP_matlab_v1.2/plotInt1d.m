function  [sample,index]=plotInt1d(F)
 N=F.N;
 size=F.size;
 sample = Intensity(F);
 sample = sample(floor(N/2)+1,1:N);
 xaxis=linspace(-size*1e2/2,size*1e2/2,N);
 [~,index] = max(sample);
 plot(xaxis*10,sample,'-');
 xlabel('x (mm)')
 ylabel('Intensity')
 axis('square')
end

