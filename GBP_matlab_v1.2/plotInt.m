function plotInt(F)
size=F.size;
N=F.N;
imagesc(Intensity(F))
tick = 9;
axis image
colormap jet;
xticks(linspace(1,N,tick))
xticklabels(linspace(-size*1e3/2,size*1e3/2,tick))
xlabel('x (mm)')
yticks(linspace(1,N,tick))
yticklabels(linspace(-size*1e3/2,size*1e3/2,tick))
ylabel('y (mm)')
title('Intensity');
colorbar
end
