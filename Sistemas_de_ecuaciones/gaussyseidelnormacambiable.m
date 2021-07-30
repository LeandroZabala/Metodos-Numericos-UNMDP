clc
clear all

A=[ 0 -1/4  -1/4;
    0  1/8  -1/8;    %esta es la matriz de iteracion del metodo de gauss-seidel
    0   0    1/8]    %tiene ceros en la primer columna

b=[9/4; 23/8; 7/4]      %esta es la matriz con elementos sin x
x=[0.5;2;1]             %valores iniciales de x
n=0;
ciclomax=25;
tolerancia=10^(-3);
[f,c]=size(A)  ;       % m=cantidad de colunas,n=cantidad de filas 
error=1;

while (error>tolerancia)&(n<ciclomax)
  sumatoria=0;
   n=n+1
   xant=x;
   x=A*x+b
   error=norm(x-xant)
   
end
disp('solucion encontrada:')
disp(x)
disp('cantidad de ciclos necesarios:')
disp(n)
disp('error de la aproximacion:')
disp(error)
