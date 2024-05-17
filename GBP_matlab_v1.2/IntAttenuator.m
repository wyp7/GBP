function Fout = IntAttenuator(att,Fin)
Fout = Fin;
C = sqrt(att).*Fin.A;
Fout.A = C;
end