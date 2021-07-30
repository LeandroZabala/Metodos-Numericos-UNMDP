# Aproximacion por cuadrados minimos
# X1 e Y1 son declarados como vector como vector
# n es el grado del polinomio
# tanto X1 como Y1 deberan tener n+1 puntos

function [P, DD] = newton2(X1, Y1)

longitud=size(X1);
m=longitud(1,2);
n=m-1
CM=zeros(m-1,2);

for i=1:n
  P=polyfit(X1,Y1,i)
  zeros(i,1)=i;
  zeros(i,2)=P;
 end
 
