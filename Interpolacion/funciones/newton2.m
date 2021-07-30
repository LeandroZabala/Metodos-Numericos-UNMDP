#Interpolacion de newton (diferencias divididas progresivas)
# X1 e Y1 son declarados como vector como vector
# n es el grado del polinomio
# tanto X1 como Y1 deberan tener n+1 puntos
# DD es la matriz de diferencias divididas

function [plolinomiografico, DD, XXn, YYn] = newton2(X1, Y1)
longitud=size(X1);
n=longitud(1,2)-1;
DD=zeros(n+1);    %creo una matriz cuadrada de ceros
DD(:,1)=Y1;        %lleno la primer columna de DD con los elementos de Y

% calculo la matriz de diferencias divididas
for k=2:n+1       
    for J=k:n+1
        DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X1(J)-X1(J-k+1)];
    end
end

% muestro por pantalla la matriz de diferencias divididas
disp('La matriz de diferencias divididas es:');
disp(DD);

disp('El polinomio de newton es');
syms x;
polnew=DD(1,1);
P=1;
for i=1:n
    P=P*(x-X1(i));
    polnew=polnew+P*DD(i+1,i+1);
end

polnew=expand(polnew);
pretty(polnew);
polinomiografico=vpa(polnew, 5)
b=char(polinomiografico);
f=inline(b);
XXn=linspace(X1(1,1), X1(1, n+1));
longitud=size(XXn);

for i=1:longitud(1,2)
  YYn(1,i)=f(XXn(1,i));
end
#hold on
#grafico1=plot(XX,YY)
#grafico2=plot(X1,Y1,'.r','markersize',20)    % muestro los puntos por donde debe pasar el polinomio
#set(grafico1,'Color','green','LineWidth',2)
#legend('newton','puntos' )
#hold on


