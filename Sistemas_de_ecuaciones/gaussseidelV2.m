clear all;
clc;
%            ingresar datos pertenecientes al problema
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A =[-1  -7  3;
%         2  -1   8;         % Esta es la matriz de coeficientes. Se cumple que 
%         5 -2   1]          % A*x=b
A =[ 5  -1  2 -1 0;
     -2 4 -1 0 -1;         % Esta es la matriz de coeficientes. Se cumple que 
     2 2 -6 0 -1;
     -1 0 0 4 -1;
     0 -1 0 -1 2]          % A*x=b


b=[22; -14; -8; -5; -1]      %esta es la matriz A*x=b
x=[1;1;1;1;1]             %valores iniciales de x
ciclomax=25
tolerancia=10^(-4)

%       Se calcula la matriz B y c tal que X=matB*C+c
% esta es la matriz de iteracion del metodo de jacobi tiene que tener ceros en la primir columna
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[a1,a2]=size(A);   % Encuentro el tama�o de A
D = diag(diag(A));    % Encuentro D, L, U de forma que A=D+L+U
L = tril(A,-1);       % D es la diagonal de A, L es triangular estrictamente inferior
U = triu(A,1);        % U es diagonal estrictamente superior de A

matB = inv(D+L)*(-U);    
c = inv(D+L)*b;

fprintf("\n la siguiente es la matriz B:\n" )
disp(matB)
fprintf("\n la siguiente es la matriz B con fracciones:\n" )
format rat
disp(matB)
format short
fprintf("\n la siguiente es la matriz c:\n" )
disp(c)
fprintf("\n la siguiente es la matriz c con fracciones:\n" )
format rat
disp(c)
format short

%            Se verifica que el metodo converja.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R= sum(abs(A), 2);  %abs(A) calcula el valor absoluto de cada elemento de la matriz
                          % sum(abs(A), 2) suma los elementos de cada fila.
D=abs(diag(A));     % extrae la diagonal de la matriz y le calcula el valor absoluto a los elementos
W=R-D;
check= D>=W;
DD = all(check);           % devuelve 1 si todos los elementos del vector son distintos de 0
                           % DD=0 si no es EDD, DD=1 si es EDD

normaB=norm(matB,inf);   % se calcula la norma infinito de la matriz B (la que tiene 0 en la primer columna)

fprintf('\n\n');           %deja un renglon vacio
if DD==1
  disp("la matriz es EDD. El metodo converje")
  fprintf('la norma infinito de la matriz B (la de 0 en la 1er columna) es:  ')  
  disp(normaB)
else
  disp("la matriz NO es EDD")
  fprintf('la norma infinito de la matriz B (la de 0 en la primer columna) es:  ')  
  disp(normaB)
  disp("Se procede a calcular el radio espectral")
  respec=max(abs(eig(matB)));     %se calcula el radio espectral de la matriz de coeficientes
  fprintf('el radio espectral de la matriz es:  ') 
  disp(respec) 
  if respec<1
      fprintf('\n\n');           %deja un renglon vacio
      disp("la matriz es valida. El metodo converje")
     else
      fprintf('\n\n');           %deja un renglon vacio
      disp("la matriz NO es valida. El metodo diverje")
      disp('probar intercambiando filas')
  endif
endif

%               Ejecucion del metodo numerico.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
error1= 999;

fprintf('\n la solucion del sistema en la iteracion %4.0f',n)
fprintf('   (condiciones iniciales)\n')
  for i=1:a1
    fprintf(' x(%1.0f)=%6.8f\n',i,x(i))
  end  
fprintf('\ncalculo de error |X(n)-X(n-1)|')
fprintf('norma euclidea(2) -------- \n')
fprintf('norma suma(1) --------- \n')
fprintf('norma del maximo (INF) --------\n')
residuo=norm( A*x-b, 2);           % Se puede cambiar la norma del residuo.
                                  % reemplazar por 1_ norma suma;
                                  % reemplazar por 2_ norma euclidea
                                  % reemplazar por inf norma infinito
fprintf('residuo A*x-b %8.8g \n',residuo)   
disp("--------------------------------------------")


while (error1>tolerancia)&&(n<ciclomax)
   n=n+1;
   xant=x;
   x=matB*x+c;
   error1=norm(x-xant);   % aca se puede cambiar la norma  
   errorsuma=norm(x-xant, 1);
   errorinf=norm(x-xant, inf);
   fprintf('\n la solucion del sistema en la iteracion %4.0f\n',n)
     for i=1:a1
       fprintf(' x(%1.0f)=%6.8f\n',i,x(i))
     end  
   fprintf('\ncalculo de error |X(n)-X(n-1)|\n')
   fprintf('norma euclidea(2) %8.8g \n',error1)
   fprintf('norma suma(1) %8.8g \n',errorsuma)
   fprintf('norma del maximo (INF) %8.8g \n',errorinf)
   residuo=norm( A*x-b, 2);        % Se puede cambiar la norma del residuo.
                                  % reemplazar por 1_ norma suma;
                                  % reemplazar por 2_ norma euclidea
                                  % reemplazar por inf norma infinito
   fprintf('residuo (A*x-b) %8.8g \n',residuo)
   disp("--------------------------------------------")

end