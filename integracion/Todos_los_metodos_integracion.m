%VALORES EJERCICIO 1-a
X1=[0 0.15 0.3 0.45 0.6 0.75 0.9 1.05 1.2 ]
Y1=[pi/2 1.19946 0.11077 -1.1827 -1.7948 -1.7319 -0.98073 0.44109 1.6553]
clc
pkg load symbolic
syms x
f= 1/x
a=2.0625   %limite inferior
b=4.4399   %limite superior


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [resultado]=Trapecios_compuesto_funcion(f,a,b,error,N) 
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

for i=2:(n)     % sumo todos los puntos menos los correspondientes a a y b
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []=Trapecios_compuesto_puntos(X1, Y1)
%recordar que el paso (h) debe ser "constante"

n=length(X1)-1;
h=(X1(length(X1))-X1(1))/n;

S=0; 
  
  for i=2:n   % sumo todos los puntos menos los correspondientes a a y b
    S=S+Y1(i);
  endfor

resultado=((h/2)*(Y1(1)+Y1(n+1)+2*S))
  h,n

endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Simpson_13_funcion(f,a,b,error,N) 
  %para un n determinado, ingresar error=0
  % si solo se sabe el error, ingresar cualquier valor de N distinto de 0
syms x

F=function_handle(f)
fiv=diff(f,4);
Fiv=function_handle(fiv)

% las siguientes lineas calculan el maximo de la derivada cuarta de f en modulo
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

% se grafica la derivada cuarta y su valor maximo en modulo
hold on
fplot(Fiv, [a, b])
plot(posx,abs_max,'.r','markersize',20);
title('derivada cuarta y su maximo (en valor absoluto)')
hold off
fprintf('el maximo de la derivada se encuentra en (x,y)= (%6.6g , %6.6g )\n', posx, abs_max)


if error==0           % si error=0 significa que el usuario quiere usar una cantidad de intervalos definida por el
  n=N;
  h=(b-a)/n;
 else        % si error es distinto de 0, se busca un h que permita obtener el error deseado por el usuario.
  h=((error*180)/(abs_max*(b-a)))^(1/4);
  n=(b-a)/h;
  n=round(n);
  P_I=(-1)^n;
    if P_I==(-1)
       n=n+1;
    else 
       n=n+2;
    endif

  h=(b-a)/n;
endif

k=linspace(a,b,n+1);  % se genera un vector con n+1 puntos (n es la cantidad de intervalos)
for i=1:(n+1)
  Fk(i)=feval(F,k(i));    % se evalua la funcion en todos los puntos
endfor

S_Par=0;
S_Impar=0;

for i=1:(n/2)
  S_Impar=S_Impar+Fk(2*i);
endfor

for i=2:(n/2)
  S_Par=S_Par+Fk((2*(i-1))+1);
endfor

resultado=(h/3)*(Fk(1)+Fk(n+1)+(4*S_Impar)+(2*S_Par));
Et=((h^4)*(b-a)*abs_max)/180;

format 
h,n
format shortEng
Et
format long
resultado

endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Simpson_13_puntos(X1,Y1)
syms x

n=length(X1)-1;

P_I=(-1)^n;
if P_I==(-1)
  disp('Es necesario un numero impar de datos, dado que el numero de intervalos debe ser par.')
else 
  h=(X1(length(X1))-X1(1))/n;
  S_Par=0;
  S_Impar=0;  
  
  for i=1:(n/2)
    S_Impar=S_Impar+Y1(2*i);
  endfor
  for i=2:(n/2)
    S_Par=S_Par+Y1((2*(i-1))+1);
endfor
  resultado=(h/3)*(Y1(1)+Y1(n+1)+(4*S_Impar)+(2*S_Par))
  h,n
endif
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Simpson_38_funcion(f,a,b,error,N) 
%para un n determinado, ingresar error=0
syms x

F=function_handle(f)
fiv=diff(f,4);
Fiv=function_handle(fiv)

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
hold on
fplot(Fiv, [a, b])
plot(posx,abs_max,'.r','markersize',20);
title('derivada cuarta y su maximo (en valor absoluto)')
hold off
fprintf('el maximo del modulo de la derivada se encuentra en (x,y)= (%6.6g , %6.6g )\n', posx, abs_max)

if error==0
  n=N;
  h=(b-a)/n;
else 
h=((error*80)/(abs_max*(b-a)))^(1/4);
n=(b-a)/h;
n=round(n);
while rem(n,3)!=0
  n=n+1;
endwhile
h=(b-a)/n;
endif

k=linspace(a,b,n+1);
for i=1:(n+1)
  Fk(i)=feval(F,k(i));
endfor

S_1=0;
S_2=0;
S_3=0;

for i=1:((n-3)/3)
  S_3=S_3+Fk((3*i)+1);
endfor
for i=0:((n-3)/3)
  S_1=S_1+Fk((3*i)+2);
endfor
for i=0:((n-3)/3)
  S_2=S_2+Fk((3*i)+3);
endfor

resultado=((3*h)/8)*(Fk(1)+Fk(n+1)+(3*S_1)+(3*S_2)+(2*S_3))

Et=((h^4)*(b-a)*abs_max)/80;


h,n
format shortEng
Et
format long
resultado

endfunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [resultado]=Simpson_38_puntos(X1,Y1)
syms x

n=length(X1)-1;


if rem(n,3)!=0
  disp('La cantidad de intervalos debe ser multiplo de 3')
  disp('Ingresar (3*3m)+1 puntos, m entero')
else 
  h=(X1(length(X1))-X1(1))/n;
  S_1=0;
  S_2=0;
  S_3=0; 
  
for i=1:((n-3)/3)
  S_3=S_3+Y1((3*i)+1);
endfor
for i=0:((n-3)/3)
  S_1=S_1+Y1((3*i)+2);
endfor
for i=0:((n-3)/3)
  S_2=S_2+Y1((3*i)+3);
endfor
  resultado=((3*h)/8)*(Y1(1)+Y1(n+1)+(3*S_1)+(3*S_2)+(2*S_3))
  h,n
endif
endfunction


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function []=Romberg_funcion(f,a,b,error,N) 
%N representa el numero de subintervalos
%para un N determinado, ingresar error=0
syms x

F=function_handle(f)

i=1;
h(i)=abs(b-a);
R(i,1)=(h(i)/2)*(feval(F,a)+feval(F,b));
i=i+1;


if error~=0
  Et=error+1;
  while Et>error 
    for k=1:(2^(i-2))
      Sum_F(k)=feval(F,(a+((((2*k)-1)/2)*h(i-1))));
    endfor
    
    R(i,1)=0.5*(R(i-1,1)+h(i-1)*(sum(Sum_F)));
    Et=abs(R(i,1)-R(i-1,1));
    h(i)=abs(b-a)/(2^(i-1));
    i=i+1;
  endwhile
n=i-1
format long g
R



else
  for i=2:N
    for k=1:(2^(i-2))
      Sum_F(k)=feval(F,(a+((((2*k)-1)/2)*h(i-1))));
    endfor
    
    R(i,1)=0.5*(R(i-1,1)+h(i-1)*(sum(Sum_F)));
    Et=abs(R(i,1)-R(i-1,1));
    h(i)=abs(b-a)/(2^(i-1));
    n=i+1;
  endfor
  
  
n=N
format long g
R
endif
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Romberg_puntos(X1,Y1)
  
n=log2(2*length(X1)-2);
i=1;

if mod(n,1)==0
  a=X1(1);
  b=X1(length(X1));
  h(i)=abs(b-a);
  R(i,1)=(h(i)/2)*(Y1(1)+Y1(length(Y1)));
  
  for i=2:n
    for k=1:(2^(i-2))
      v_aux=a+((((2*k)-1)/2)*h(i-1));
      
      Sum_F(k)=Y1(find(X1==v_aux));
    endfor
    
    R(i,1)=0.5*(R(i-1,1)+h(i-1)*(sum(Sum_F)));
    Et=abs(R(i,1)-R(i-1,1));
    h(i)=abs(b-a)/(2^(i-1));
    n=i+1;
  endfor
  
n
format long g
R

else 

  disp('Ingresar 2^(k-1)-1 puntos, k entero')

endif
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function R = romberg_Richardson_funcion(f, a, b, max_k)
% Compute the triangular extrapolation table for Romberg integration
% using the composite trapezoid rule, starting with h=b-a.
% f: function name SYMBOLIC
% a, b: lower and upper limits of integration
% max_k: the number of extrapolation steps (= number of columns in R, plus one.)
% max_k=0 will do no extrapolation.

R = zeros(max_k+1);
  for j=1:max_k+1
    R(j,1) = Trapecios_compuesto_funcion(f,a,b,0,2^(j-1));
  endfor
  for k=2:max_k+1
    for j=k:max_k+1
      R(j,k) = (4^(k-1)*R(j,k-1)-R(j-1,k-1))/(4^(k-1)-1);
    endfor
  endfor
endfunction