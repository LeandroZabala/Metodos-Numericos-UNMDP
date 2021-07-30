# este programa se encarga de graficar los polinomios de interpolacion
# de newton, spline cubicos, y lagrange.
# le entran las tablas de valores que devuelve cada funcion.

X=[1 2 5 10 20 30 40]
Y=[56.5 78.6 113 144.5 181 205 214.5]

[PP,XXs,YYs]= spline2(X,Y);
[polinomiografico,DD,XXn,YYn]=newton2(X,Y);



hold on
grafico1 = plot(XXn,YYn);
grafico2 = plot(XXs,YYs);
grafico3=plot(X1,Y1,'.r','markersize',20);
#grafico4 = plot(XXl,YYl);
set(grafico1,'Color','green','LineWidth',1)
set(grafico2,'Color','blue','LineWidth',1)
legend('newton', 'spline','puntos')

hold off
