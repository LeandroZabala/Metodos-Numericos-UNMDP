#Interpolacion de trazador cubibico [naural o que?]
# X1 e Y1 son declarados como vector como vector
# n es el grado del polinomio
# tanto X1 como Y1 deberan tener n+1 puntos

function [PP,XXs,YYs] = spline2(X1, Y1)
  
longitud=size(X1);
n=longitud(1,2)-1;
PP=spline(X1, Y1);
XXs=linspace(X1(1,1), X1(1, n+1));
YYs=ppval(PP, XXs);

%hold on
%grafico3=plot(XX,YY)
%set(grafico3,'Color','yellow','LineWidth',2)
%legend('spline')
%plot(X1,Y1,'.r','markersize',20)    % muestro los puntos por donde debe pasar el polinomio
%hold on