function plot4(Fin)


subplot(2,2,1)
plotInt(Fin);
title("Intensity")

subplot(2,2,2)
plotPhase(Fin);
title("Phase")

subplot(2,2,3)
plotInt1d(Fin);

subplot(2,2,4)
plotPhase1d(Fin);

end
