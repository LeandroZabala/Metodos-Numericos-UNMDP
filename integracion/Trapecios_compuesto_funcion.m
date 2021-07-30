function []=Trapecios_compuesto_funcion(f,a,b,error,N) 
%para un n determinado, ingresar error=0
syms x

F=function_handle(f)
fiv=diff(f,2);
Fiv=function_handle(fiv)

% las siguientes lineas calculan el maximo de la derivada segunda de f en modulo
if a!=0
  abs_max=abs(feval(Fiv,a));
  posx=a;
else
  abs_max=abs(feval(Fiv,(a+0.0001)));
  posx=a+0.0001;
endif

for i=(a+0.0001):0.0001:b
  e1=abs(feval(Fiv,i));
  if (abs_max<e1)
    abs_max= e1;
    posx=i;
  endif
endfor 
% se grafica la derivada segunda y su valor maximo en modulo
hold on
fplot(Fiv, [a, b])
plot(posx,abs_max,'.r','markersize',20);
title('derivada segunda y su maximo (en valor absoluto)')
hold off
fprintf('el maximo del modulo de la derivada se encuentra en (x,y)= (%6.6g , %6.6g )\n', posx, abs_max)

  if error==0   % si error=0 significa que el usuario quiere usar una cantidad de intervalos definida por el
    n=N;
    h=(b-a)/n;
  else 
    h=((error*12)/(abs_max*(b-a)))^(1/2);
    n=(b-a)/h;
    n=round(n);
    h=(b-a)/n;
   endif

k=linspace(a,b,n+1);
for i=1:(n+1)
  Fk(i)=feval(F,k(i));  % evaluo la funcion en n+1 puntos= n intervalos
endfor

S=0;

for i=2:(n)
  S=S+Fk(i);
endfor

resultado=((h/2)*(Fk(1)+Fk(n+1)+2*S));

Et=((h^2)*(b-a)*abs_max)/12;


h,n
format shortEng
Et
format long
resultado

endfunction