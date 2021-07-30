% ESTE PROGRAMA SIRVE PARA SIMPLIFICAR LOS CALCULOS EN EL METODO DE 
% MINIMOS CUADRADOS. SIGUE EL ALGORITMO USADO PARA HACER EL CALCULO
% MANUAL
clear all
clc
X1=[-6 -1 4 9 ]
Y1=[-4 6 1 14 ]
longitud=size(X1);
m=longitud(1,2);
n=m-1;
%        impresion de la tabla (imita el calculo a mano)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a continuacion se muestra por pantalla la cabecera de la tabla.
cont1=0;
cont2=0;
fprintf('K  ')
for i=0:m
  fprintf(' Xk^(%1.0f)  ',i)
  cont1= cont1+1;
end  
for i=0:n
  fprintf(' Y*Xk^(%1.0f)  ',i)
  cont2= cont2+1;
end
fprintf(" \n")

% a continuacion se completa la tabla con los valores
for i=1:m
  fprintf('(%1.0f)  ',i-1) % imprime el valor de K
 for i2=0:(cont1-1)
    fprintf('%6.8g  ',X1(i)^(i2))   % imprime el valor de x^...
    table(i,i2+1)=(X1(i)^(i2));           % guarda los valores en una matriz para luego hacer operaciones
 endfor
  
 for i3=0:(cont2-1)
      fprintf('%6.8g     ',Y1(i)*X1(i)^(i3))   % imprime el valor de x^...
      table(i,i3+m+2)=Y1(i)*X1(i)^(i3);   % guarda los valores en una matriz para luego hacer operaciones
 endfor
  fprintf(" \n")
endfor  
fprintf("suma")
t=size(table);
t=t(1,2);
suma=sum(table); %suma las columnas de table
for i=1:t
  
  fprintf(' %6.4g ',suma(1,i)) % imprime la suma de toda la columna
endfor