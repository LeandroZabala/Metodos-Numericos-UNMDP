clc
clear all

A=[ 0  -1/4  -1/4;
   -1/2  0   -1/4;    %esta es la matriz de iteracion del metodo de jacobi
   -1/4 -1/2   0]     %tiene que tener ceros en la diagonal

b=[9/4; 4; 15/4]      %esta es la matriz con elementos sin x
x=[0.5;2;1]             %valores iniciales de x
n=0;
ciclomax=25
tolerancia=10^(-3);
[f,c]=size(A)  ;       % m=cantidad de colunas,n=cantidad de filas 
error=1;

while (error>tolerancia)&(n<ciclomax)
   n=n+1
   xant=x;
   x=A*x+b
   error=norm(x-xant)   % aca se puede cambiar la norma  
end
disp('solucion encontrada:')
disp(x)
disp('cantidad de ciclos necesarios:')
disp(n)
disp('error de la aproximacion:')
disp(error)
