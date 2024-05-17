function [sample]=plotPhase1d(Fout)
 N=Fout.N;
 size=Fout.size;
 A=Fout.A;
 sample=unwrap(angle(A(floor(N/2)+1,1:N)));
 if sample((N+1)/2)>sample((N+1)/2+300)
    sample = sample - max(sample((N+1)/2-100:(N+1)/2+100));
 else
     sample = sample - min(sample((N+1)/2-100:(N+1)/2+100));
 end
 xaxis=linspace(-size*1e3/2,size*1e3/2,N);
 p = plot(xaxis,sample,'-');
 xlabel('x (mm)')
 ylabel('Phase')
 axis('square');
end