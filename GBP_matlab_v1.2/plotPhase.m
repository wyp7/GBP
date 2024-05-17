function plotPhase(Fout)
N=Fout.N;
size=Fout.size;
A=gather(Fout.A);
sample=angle(A);
 

imagesc(sample)
axis image
title('phase')
xticks(linspace(1,N,11))
xticklabels(linspace(-size*1e3/2,size*1e3/2,11))
xtickangle(90)
xlabel('x (mm)')
yticks(linspace(1,N,11))
yticklabels(linspace(-size*1e3/2,size*1e3/2,11))
ylabel('y (mm)')
colorbar

% figure;
% sample2 = cos(sample);
% imagesc(sample2)
% 
% axis image
% title('phase')
% xticks(linspace(1,N,11))
% xticklabels(linspace(-size*1e3/2,size*1e3/2,11))
% xtickangle(90)
% xlabel('x (mm)')
% yticks(linspace(1,N,11))
% yticklabels(linspace(-size*1e3/2,size*1e3/2,11))
% ylabel('y (mm)')
% colorbar
% title("cos(\phi)")
% 
% figure;
% xaxis = linspace(-size*1e3/2,size*1e3/2,N);
% phase_sample = sample2(513,:);
% plot(linspace(-size*1e3/2,size*1e3/2,N),sample2(513,:))


end