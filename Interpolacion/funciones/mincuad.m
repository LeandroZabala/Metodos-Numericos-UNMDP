# Aproximacion por cuadrados minimos
# X1 e Y1 son declarados como vector como vector
# tanto X1 como Y1 deberan tener n+1 puntos
# scalcula todos los polinomios de aproximacion posibles
# calcula el polinomio de interpolacion por cuadrados minimos

function [P, coeficientes, matvar] = mincuad(X1, Y1)

longitud=size(X1);
m=longitud(1,2);
n=m-1;
CM=zeros(n,m+1);
matvar=zeros(n,2);    % matvar= matriz de varianza

XX=linspace(X1(1,1), X1(1,m));
for i=1:n
  sum=0;
  P=polyfit(X1,Y1,i);
    for i2=1:i+1
        zeros(i,i2)=P(1,i2);
   end  
   
    for i3=1:m
       diferencia=((Y1(1,i3)-polyval(P,X1(1,i3)))^2);
       sum= sum+diferencia;
     end
  varianza=sum/(m-i-1);
  matvar(i,1)=i;
  matvar(i,2)=varianza;
  YY=polyval(P,XX);
  plot(X1,Y1,'.r','markersize',20)
  hold on
  plot(XX,YY)
 end
  disp('ordenados de forma descendente. ax+b en el segundo renglon ax^2+b*x+c')
  disp('el ultimo polinomio es de interpolacion')
  #format long
  #format short
  format shortEng
 coeficientes=zeros
 format short
 matvar
 
