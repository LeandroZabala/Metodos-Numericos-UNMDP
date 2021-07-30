#Interpolacion de newton (diferencias divididas regresivas)
clear;clc;
#----------entrada de datos-------------
disp('metodos numericos');
disp('interpolacion');
disp('interpolacion');
n=input('ingrese el grado del polinomio, n=');
fprintf('Se necesitan %.0f puntos\n',n+1);
disp('ingrese los puntos');
#creo 2 vectores X e Y con los valores de ordenadas y abscisas
for i=1:n+1                   
    fprintf('x%.0f=',i-1);
    X(i)=input(' ');
    fprintf('y%.0f=',i-1);
    Y(i)=input(' ');
end
DD=zeros(n+1);    %creo una matriz cuadrada de ceros
DD(:,1)=Y;        %lleno la primer columna de DD con los elementos de Y

% calculo la matriz de diferencias divididas
for k=2:n+1       
    for J=k:n+1
        DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X(J)-X(J-k+1)];
    end
end

% muestro por pantalla la matriz de diferencias divididas
disp('La matriz de diferencias divididas es:');
disp(DD);

% calculo el polinomio interpolante de newton 
% con diferencias divididas regresivas
disp('El polinomio de newton es');
syms x;
polnew=DD(n+1,1);
P=1;
for i=1:n
    P=P*(x-X(n+2-i));
    polnew=polnew+P*DD(n+1,i+1);
end
polnew=expand(polnew);
pretty(polnew);
x=input('ingrese el valor de x a interpolar,x=');
vi=eval(polnew);
fprintf('el valor interpolado es %.2f\n',vi);
hold on;
ezplot(polnew,[X(1) X(n+1)]);
plot(x,vi,'r+');