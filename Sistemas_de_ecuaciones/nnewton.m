% metodo numerico para resolver sistemas de ecuaciones no lineales
% usando el metodo de newton rapson
clear all;
clc;
pkg load symbolic
syms x y 
%            ingresar datos pertenecientes al problema
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 x0=[-2;-3]
 fname=[4*x^2-9*y^2-16*x-18*y-29;x.^2-6*x+y.^2-36]
 tolerancia=10^-3;
 maxiter = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprima=jacobian(fname);     % se calcula el jacobiano de fname
disp("jacobiano:")
disp(fprima)                % se muestra por pantalla 
fnameh = function_handle (fname);
fnameh(0,0);
fprimah= function_handle (fprima);
fprimah(0,0);

n = 0;
disp("")
disp("--------------------------------------------")
fprintf('\n la solucion del sistema en la iteracion %4.0f\n',n)
  for i=1:2
    fprintf(' x(%1.0f)=%6.8f\n',i,x0(i))
  end   
result=fnameh(x0(1),x0(2));
fprintf('\n las funciones evaluadas en los valores iniciales: \n',n)
  for i=1:2
    fprintf(' resultado f(%1.0f)=%6.8f \n',i,result(i))
  end 
  fprintf('\ncalculo de error |X(n)-X(n-1)| \n')
  fprintf('norma euclidea(2) -------- \n')
  fprintf('norma suma(1) --------- \n')
  fprintf('norma del maximo (INF) --------\n')
  error=norm(result,2);
  fprintf('resuduo (norma euclidea) ||f1(x0), f2(x0)||=  %8.8g \n', error)


 while error >= tolerancia
  n=n+1;
  fx0=fnameh(x0(1),x0(2));          % funcion especializada en x0
  fpx0=fprimah(x0(1),x0(2));        % jacobiano especializado en x0
  x1=x0-inv(fpx0)*fx0;    
  result=fnameh(x1(1),x1(2));
  error =norm((result),2);
  disp("--------------------------------------------")
  fprintf('\n la solucion del sistema en la iteracion %4.0f\n',n)
     for i=1:2
       fprintf(' x(%1.0f)=%6.8f\n',i,x1(i))
     end   
  fprintf('\n las funciones evaluadas \n')
     for i=1:2
       fprintf(' resultado f(%1.0f)=%6.8f \n',i,result(i))
     end
  fprintf('\n Jacobiano especializado en x0: \n')
  disp(fpx0)
  
  error1=norm(x1-x0,2);   % aca se puede cambiar la norma  
  errorsuma=norm(x1-x0, 1);
  errorinf=norm(x1-x0, inf);
  
  fprintf('\ncalculo de error |X(n)-X(n-1)|\n')
  fprintf('norma euclidea(2) %8.8g \n',error1)
  fprintf('norma suma(1) %8.8g \n',errorsuma)
  fprintf('norma del maximo (INF) %8.8g \n',errorinf)
  fprintf('resuduo (norma euclidea) ||f1(x0), f2(x0)||=  %8.8g \n', error)

    if n > maxiter
      fprintf(' Numero maximo de iteraciones excedido \n');
      return;
  end
   x0=x1;   
 endwhile