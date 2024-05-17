function Fout = InterfereCenter(F1,F2)
N = F1.N;
size = F1.size;

w1 = N/4;
A1 = gather(F1.A);
[~,A1_center] = max(A1(floor(N/2)+1,1:N));
A1_recenter = A1(N/4:3*N/4,A1_center-w1:A1_center+w1);

w2 = N/4;
A2 = gather(F2.A);
[~,A2_center] = max(A2(floor(N/2)+1,1:N));
A2_recenter = A2(N/4:3*N/4,A2_center-w2:A2_center+w2);

Fout = F1;
Fout.A = A1_recenter+A2_recenter;
Fout.size = size/2;
Fout.N = (N+1)/2;

end
