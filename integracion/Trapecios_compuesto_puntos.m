function []=Trapecios_compuesto_puntos(X1, Y1)
%recordar que el paso (h) debe ser "constante"

n=length(X1)-1;
h=(X1(length(X1))-X1(1))/n;

S=0; 
  
  for i=2:n
    S=S+Y1(i);
  endfor

resultado=((h/2)*(Y1(1)+Y1(n+1)+2*S))
  h,n

endfunction