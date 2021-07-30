clear all
clc
%calculadora de B y c
A=[ 5  -2  1;
  -1  -7   3;         % Esta es la matriz de coeficientes. Se cumple que 
   2 -1   8]          % A*x=b
b=[3; -2; 1]          % Esta es la matriz b.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[a1,a2]=size(A);            % Encuentro el tamaño de A
diago=diag(A);
for n=1:a1 
  matB(n,:)=-A(n,:)/diago(n,1);      % divido la fila n por el elemento cambiado de signo nn (de la diagonal) 
  matB(n,n)=matB(n,n)+1;             % Le sumo 1 a la diagonal para que me queden 0 en la diagonal
  c(n,1)=b(n,1)/diago(n,1);          % Divido el elemento n del vector b por el elemento de la diagonal de A
endfor
fprintf("\n la siguiente es la matriz B:\n" )
disp(matB)
fprintf("\n la siguiente es la matriz B forma matricial:\n" )
format rat
disp(matB)
format short
