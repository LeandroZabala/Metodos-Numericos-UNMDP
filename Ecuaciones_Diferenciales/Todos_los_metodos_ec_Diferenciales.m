clc
pkg load symbolic
syms x
syms y
syms t
syms z
%indice:
% 1_ resolucion de ecuaciones diferenciales de primer orden con euler.
% 2_ resolucion de ecuaciones diferenciales de primer orden con euler. Se tiene la solucion analitica tambien
% 3_ resolucion de ecuaciones diferenciales de primer orden con euler MEJORADO (HEUN).
% 4_ resolucion de ecuaciones diferenciales de primer orden con euler MEJORADO.(HEUN) Se tiene la solucion analitica tambien
% 5_ resolucion de ecuaciones diferenciales de primer orden RK4.
% 6_ resolucion de sistema de 2 ecuaciones diferenciales usando euler mejorado (HEUN)
% 7_ resolucion de sistema de 2 ecuaciones diferenciales usando euler.
% 8_ resolucion de sistemas de 2 ecuaciones diferenciales usando RK4
% 9_ resolucion de sistema de 3 ecuaciones diferenciales usando euler.
% 10_ resolucion de sistema de 3 ecuaciones diferenciales usando euler mejorado (HEUN).
% 11_ en progreso.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Euler(f,h,T0,Tf,y0,T_buscado)
  % si no se cuenta con la solucion a la ecuacion diferencial, fanalitica=0
  % tanto f como fanalitica deben definirse de forma simbolica.
  
  %auxf=char(f);
  %F=inline(auxf);
  %F=function_handle(f);
  F=f;
  
  n=((Tf-T0)/h)+1;  %numero de filas y de tk 
  for i=1:n
    R(i,1)=T0+(h*(i-1));
  endfor
  
  R(1,2)=y0;
  
  for i=2:n
    R(i,2)=R(i-1,2)+h*(F(R(i-1,1),R(i-1,2)));
  endfor
  
  R_Buscado(1,1)=T_buscado;
  R_Buscado(1,2)=R(find(R==T_buscado),2);
  disp("tabla de resultados")
  fprintf('\n      t          y   \n')
  for i=1:n
    fprintf(' %6.6g     %6.6g  \n',R(i,1),R(i,2)  )
  endfor
  
  format short
  Tabla_de_Resultados=R
  format long e
  R_Buscado
  
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Euler_con_solucion(f,fsol,h,T0,Tf,y0)
% funciona con euler (NO EULER MEJORADO)
% donde: f es la ecuacion diferencial dy/dt
% fsol es la solucion de la ecuacion diferencial y(t)=...
% h es el ancho de paso
% T0 es el valor inicial de t y Tf es el valor final (punto final del intervalo)
% y0 es el valor inicial de Y (Y(T0))

F=f;
%F=function_handle(f);
%fsol=function_handle(fsol);

a=Tf-T0;
l=a/h;
Yvect=zeros(1,l+1);
Xvect=zeros(1,l+1);
Yvect(1,1)=y0;
Xvect(1,1)=T0;
fprintf ('x  \t\t y (Euler)\t y (analytical) \t Euler-analytical \n') % data table header
fprintf ('%f \t %f\t %f\n',T0,y0,fsol(T0));
i=2;

for x = T0 : h : Tf-h
  y0 = y0 + F(x,y0)*h;
  Yvect(1,i)=y0;
  x = x + h;
  Xvect(1,i)=x;
  error=(fsol(x)-y0);
  fprintf ('%f \t %f\t %f\t\t %f\n',x,y0,fsol(x), error);
  i=i+1;
end

XX=linspace(T0, Tf);
l=size(XX);
l2=l(1,2);
for i=1:l2
  YY(1,i)=fsol(XX(1,i));
end
plot(Xvect, Yvect)
hold on
plot(XX, YY)
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [RR]=Euler_mejorado_Heun(f,h,T0,Tf,y0,T_buscado) 
  %auxf=char(f);
  %F=inline(auxf);
  %F=function_handle(f);
  
  F=f;
  n=((Tf-T0)/h)+1;  %numero de filas y de tk 
  for i=1:n
    R(i,1)=T0+(h*(i-1));
  endfor
  for i=1:n
    RR(i,1)=T0+(h*(i-1));
  endfor  
  
  R(1,2)=y0;
  RR(1,2)=y0;
  
  for i=2:n
    
  endfor
  
  for i=2:n
    R(i,2)=RR(i-1,2)+h*(F(R(i-1,1),RR(i-1,2)));
    aux1=F(RR(i-1,1),RR(i-1,2));
    aux2=F(RR(i,1),R(i,2));
    RR(i,2)=RR(i-1,2)+(0.5*h)*(aux1+aux2);
  endfor
  R_Buscado(1,1)=T_buscado;
  R_Buscado(1,2)=RR(find(RR==T_buscado),2);
  
  format short
  Tabla_de_Resultados=RR
  format long e
  R_Buscado
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Euler_mejorado_con_funcion(f,fsol,h,T0,Tf,y0)
% funciona con EULER MEJORADO
% donde: f es la ecuacion diferencial dy/dt
% fsol es la solucion de la ecuacion diferencial y(t)=...
% h es el ancho de paso
% T0 es el valor inicial de t y Tf es el valor final (punto final del intervalo)
% y0 es el valor inicial de Y (Y(T0))

  %F=function_handle(f);
  %fsol=function_handle(fsol);
  F=f;
  
  x0=T0
  xn=Tf
  n=(xn-x0)/h;
  Xvect=zeros(1,n);
  Yvect=zeros(1,n);
  fprintf('\n x        y(euler)     y(analitica))        f(analitica)-y(euler)'); 
  Xvect(1,1)=x0;
  Yvect(1,1)=y0;
  i=1;
    while x0<=xn
     fprintf('\n%4.5f   %4.5f      %4.5f                %4.5f',x0,y0,fsol(x0), fsol(x0)-y0);%values of x and y
     k=y0+h*F(x0,y0);
     x1=x0+h;
     y1=y0+h/2*(F(x0,y0)+F(x1,k)); 
     Yvect(1,i+1)=y1;   
      x0=x1;
     y0=y1;
     i=i+1;
    end
  l=size(Xvect);
  l=l(1,2);
  plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
  hold on
  XX=linspace(x0, xn);
  l=size(XX);
  l2=l(1,2);
    for i=1:l2
      YY(1,i)=fsol(XX(1,i));
    end
  plot(XX,YY)
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R]=Runge_Kutta_4(f,h,T0,Tf,y0,T_buscado)
  %auxf=char(f);
  %F=inline(auxf);
  %F=function_handle(f);
  F=f;
  n=((Tf-T0)/h)+1;  %numero de filas y de tk   
  
  Y(1,2)=y0;
  for i=1:n
    T(i)=T0+(h*(i-1));
  endfor
  
  for i=2:n
    K1(i-1)=h*F(T(i-1),Y(i-1,2));
    K2(i-1)=h*F((T(i-1)+(0.5*h)),(Y(i-1,2)+0.5*K1(i-1)));
    K3(i-1)=h*F((T(i-1)+(0.5*h)),(Y(i-1,2)+0.5*K2(i-1)));
    K4(i-1)=h*F((T(i-1)+h),(Y(i-1,2)+K3(i-1)));
    Y(i,2)=Y(i-1,2)+(1/6)*(K1(i-1)+(2*K2(i-1))+(2*K3(i-1))+K4(i-1));
  endfor
  format short
  K1=transpose(K1)
  K2=transpose(K2)
  K3=transpose(K3)
  K4=transpose(K4)
  Y(:,1)=T;

  Tabla_de_Resultados=Y
  R=Y((find(T==T_buscado)),2);
  
  
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[]=Sistema_2_ec_HEUN(fy,fz,h,x0,xn,y0,z0)% hay otra verison con la funcion solucion en forma de programa
% sistema de ecuaciones diferenciales con euler mejorado.
%fy  ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz  cuacion diferencial dejar x para el tiempo. z'=dz/dx
% x0 es el valor de t(tiempo) inicial
% xn es el valor de tiempo final.
% y0 es el valor de la variable y en x=0
% z0 es el valor de la variable y en z=0

%-------------------------------------------------------------------------------
% cazador-presa
%fy = @(x,y,z)0.4*z-0.02*z*y;     % ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz= @(x,y,z)0.001*z*y-0.03*y;      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx
%-------------------------------------------------------------------------------


 %Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);
 
n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
Zvect=zeros(1,n);
fprintf('\n x        y         z'); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
Zvect(1,1)=z0;
i=1;
while x0<=xn
   
    fprintf('\n%4.5f   %4.5f   %4.5f ',x0,y0,z0);%values of x and y
    ky=y0+h*fy(x0,y0,z0);  % Ky seria el Yestrellita
    kz=z0+h*fz(x0,y0,z0);   % Kz seria Zestrellita
    x1=x0+h;
    
    Xvect(1,i+1)=x1;  %Xvect va almacenando los valores de x
    y1=y0+h/2*(fy(x0,y0,z0)+fy(x1,ky,kz));  % y1 es el valor de y con euler mejorado
    z1=z0+h/2*(fz(x0,y0,z0)+fz(x1,ky,kz));  % z1 es el valor de z con euler mejorado
    Yvect(1,i+1)=y1;   
    Zvect(1,i+1)=z1;       
    x0=x1;
    y0=y1; 
    z0=z1;
    i=i+1; 
end
l=size(Xvect);
l=l(1,2);
hold on
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Zvect(1,1:l-1));
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[]=Sistema_2_ec_EULER(fy,fz,h,x0,xn,y0,z0)
% sistema de ecuaciones diferenciales con euler NO MEJORADO.
%fy  ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz  cuacion diferencial dejar x para el tiempo. z'=dz/dx
% x0 es el valor de t(tiempo) inicial
% xn es el valor de tiempo final.
% y0 es el valor de la variable y en x=0
% z0 es el valor de la variable y en z=0

%-------------------------------------------------------------------------------
% cazador-presa
%fy = @(x,y,z)0.4*z-0.02*z*y;     % ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz= @(x,y,z)0.001*z*y-0.03*y;      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx
%-------------------------------------------------------------------------------


 %Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);
 
n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
Zvect=zeros(1,n);
fprintf('\n x        y         z'); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
Zvect(1,1)=z0;
i=1;
while x0<=xn
   
    fprintf('\n%4.5f   %4.5f   %4.5f ',x0,y0,z0);%values of x and y
    y1=y0+h*fy(x0,y0,z0);  % el valor de y calculado por euler
    z1=z0+h*fz(x0,y0,z0);   % el valor de z calculado por euler
    x1=x0+h;
    
    Xvect(1,i+1)=x1;  %Xvect va almacenando los valores de x
    Yvect(1,i+1)=y1;   
    Zvect(1,i+1)=z1;       
    x0=x1;
    y0=y1; 
    z0=z1;
    i=i+1; 
end
l=size(Xvect);
l=l(1,2);
hold on
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Zvect(1,1:l-1));
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [R,Tabla_de_Resultados]=Sistema_2_ec_RK4(f,g,h,T0,Tf,x0,y0,T_buscado) %NO USAR. USAR EL PROGRAMA sistemadeecuacionesRK4xy
 % F=function_handle(f);
 % G=function_handle(g);
 % auxf=char(f);
 % F=inline(auxf);
 % auxg=char(g);
 % G=inline(auxg);
 F=f;
 G=g
  n=((Tf-T0)/h)+1;  %numero de filas y de tk   

  X(1)=x0;
  Y(1)=y0;
  
  for i=1:n
    T(i)=T0+(h*(i-1));
  endfor
  
  for i=2:n
    KF(i-1,1)=h*F(X(i-1),Y(i-1));
    KG(i-1,1)=h*G(X(i-1),Y(i-1));
    KF(i-1,2)=h*F((X(i-1)+0.5*KF(i-1,1)),(Y(i-1)+0.5*KG(i-1,1)));
    KG(i-1,2)=h*G((X(i-1)+0.5*KF(i-1,1)),(Y(i-1)+0.5*KG(i-1,1)));
    KF(i-1,3)=h*F((X(i-1)+0.5*KF(i-1,2)),(Y(i-1)+0.5*KG(i-1,2)));
    KG(i-1,3)=h*G((X(i-1)+0.5*KF(i-1,2)),(Y(i-1)+0.5*KG(i-1,2)));
    KF(i-1,4)=h*F((X(i-1)+KF(i-1,3)),(Y(i-1)+KG(i-1,3)));
    KG(i-1,4)=h*G((X(i-1)+KF(i-1,3)),(Y(i-1)+KG(i-1,3)));
    X(i)=X(i-1)+(1/6)*(KF(i-1,1)+(2*KF(i-1,2))+(2*KF(i-1,3))+KF(i-1,4));
    Y(i)=Y(i-1)+(1/6)*(KG(i-1,1)+(2*KG(i-1,2))+(2*KG(i-1,3))+KG(i-1,4));
  endfor
  format short
  disp('      K1X       K2X       K3X      K4X')
  disp(KF)
  disp("\n\n")
  disp('      K1Y       K2Y       K3Y      K4Y')
  disp(KG)
  
  Tabla_de_Resultados(:,1)=T;
  Tabla_de_Resultados(:,2)=X;
  Tabla_de_Resultados(:,3)=Y;
  
  R_Buscado(1,1)=T_buscado;
  R_Buscado(1,2)=X(find(T==T_buscado));
  R_Buscado(1,3)=Y(find(T==T_buscado));
  disp("\n\n")
  disp('      T         X        Y')
  disp(Tabla_de_Resultados)
  %plot(Tabla_de_Resultados(:,1),Tabla_de_Resultados(:,2))
  %hold on
  %plot(Tabla_de_Resultados(:,1),Tabla_de_Resultados(:,3))
  R_Buscado
  R=R_Buscado(1,3);
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[]=Sistema_3_ec_EULER(fy,fz,fu,h,x0,xn,y0,z0,u0)
% sistema de ecuaciones diferenciales con euler.
%fy  ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz  cuacion diferencial dejar x para el tiempo. z'=dz/dx
%fu  cuacion diferencial dejar x para el tiempo. u'=dz/dx

% x0 es el valor de t(tiempo) inicial
% xn es el valor de tiempo final.
% y0 es el valor de la variable y en x=0
% z0 es el valor de la variable y en z=0
% u0 es el valor de la variable y en z=0


%-------------------------------------------------------------------------------
% cazador-presa
%fy = @(x,y,z,u)15-0.3*y;     % ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz= @(x,y,z,u)0.3*(y-z);      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx
%fu= @(x,y,z,u)0.3*(z-u);      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx

%-------------------------------------------------------------------------------


 %Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);
 
n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
Zvect=zeros(1,n);
Uvect=zeros(1,n);

fprintf('\n x        y         z          u    '); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
Zvect(1,1)=z0;
Uvect(1,1)=u0;

i=1;
while x0<=xn
   
    fprintf('\n %4.5f   %4.5f   %4.5f   %4.5f ',x0,y0,z0,u0);%values of x and y
    y1=y0+h*fy(x0,y0,z0,u0);  % el valor de y calculado por euler
    z1=z0+h*fz(x0,y0,z0,u0);     % el valor de z calculado por euler
    u1=u0+h*fu(x0,y0,z0,u0);  % el valor de u calculado por euler

    x1=x0+h;
    
    Xvect(1,i+1)=x1;  %Xvect va almacenando los valores de x
    Yvect(1,i+1)=y1;   
    Zvect(1,i+1)=z1; 
    Uvect(1,i+1)=u1;     
    x0=x1;
    y0=y1; 
    z0=z1;
    u0=u1;
    i=i+1; 
end
l=size(Xvect);
l=l(1,2);
hold on
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Zvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Uvect(1,1:l-1));
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[]=Sistema_3_ec_HEUN(fy,fz,fu,h,x0,xn,y0,z0,u0)
% sistema de ecuaciones diferenciales con euler mejorado.
%fy  ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz  cuacion diferencial dejar x para el tiempo. z'=dz/dx
%fu  cuacion diferencial dejar x para el tiempo. u'=dz/dx

% x0 es el valor de t(tiempo) inicial
% xn es el valor de tiempo final.
% y0 es el valor de la variable y en x=0
% z0 es el valor de la variable y en z=0
% u0 es el valor de la variable y en z=0


%-------------------------------------------------------------------------------
% cazador-presa
%fy = @(x,y,z,u)15-0.3*y;     % ecuacion diferencial dejar x para el tiempo.  y'=dy/dx
%fz= @(x,y,z,u)0.3*(y-z);      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx
%fu= @(x,y,z,u)0.3*(z-u);      % ecuacion diferencial dejar x para el tiempo. z'=dz/dx

%-------------------------------------------------------------------------------


 %Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);
 
n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
Zvect=zeros(1,n);
Uvect=zeros(1,n);

fprintf('\n x        y         z          u    '); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
Zvect(1,1)=z0;
Uvect(1,1)=u0;

i=1;
while x0<=xn
   
    fprintf('\n %4.5f   %4.5f   %4.5f   %4.5f ',x0,y0,z0,u0);%values of x and y
    ky=y0+h*fy(x0,y0,z0,u0);  % Ky seria el Yestrellita
    kz=z0+h*fz(x0,y0,z0,u0);   % Kz seria Zestrellita
    ku=u0+h*fu(x0,y0,z0,u0);   % Ku seria Uestrellita

    x1=x0+h;
    
    Xvect(1,i+1)=x1;  %Xvect va almacenando los valores de x
    y1=y0+h/2*(fy(x0,y0,z0,u0)+fy(x1,ky,kz,ku));  % y1 es el valor de y con euler mejorado
    z1=z0+h/2*(fz(x0,y0,z0,u0)+fz(x1,ky,kz,ku));  % z1 es el valor de z con euler mejorado
    u1=u0+h/2*(fu(x0,y0,z0,u0)+fu(x1,ky,kz,ku));  % z1 es el valor de z con euler mejorado

    Yvect(1,i+1)=y1;   
    Zvect(1,i+1)=z1; 
    Uvect(1,i+1)=u1;     
    x0=x1;
    y0=y1; 
    z0=z1;
    u0=u1;
    i=i+1; 
end
l=size(Xvect);
l=l(1,2);
hold on
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Zvect(1,1:l-1));
hold on
plot(Xvect(1,1:l-1), Uvect(1,1:l-1));

endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=EDO_2orden_RK4(f,g,h,T0,Tf,y0,z0)
  %auxf=char(f);
  %F=inline(auxf);
  %auxg=char(g);
  %G=inline(auxg);
  F=f;
  G=g;
  
  n=((Tf-T0)/h)+1;  %numero de filas y de tk   

  Y(1)=y0;
  Z(1)=z0;
  
  for i=1:n
    T(i)=T0+(h*(i-1));
  endfor

  for i=2:n
    KF(i-1,1)=h*F(Z(i-1));
    KG(i-1,1)=h*G(T(i-1),Y(i-1),Z(i-1));
    KF(i-1,2)=h*F((Z(i-1)+0.5*KG(i-1,1)));
    KG(i-1,2)=h*G((T(i-1)+0.5*h),(Y(i-1)+0.5*KF(i-1,1)),(Z(i-1)+0.5*KG(i-1,1)));
    KF(i-1,3)=h*F((Z(i-1)+0.5*KG(i-1,2)));
    KG(i-1,3)=h*G((T(i-1)+0.5*h),(Y(i-1)+0.5*KF(i-1,2)),(Z(i-1)+0.5*KG(i-1,2)));
    KF(i-1,4)=h*F((Z(i-1)+KG(i-1,3)));
    KG(i-1,4)=h*G((T(i-1)+h),(Y(i-1)+KF(i-1,3)),(Z(i-1)+KG(i-1,3)));
    Y(i)=Y(i-1)+(1/6)*(KF(i-1,1)+(2*KF(i-1,2))+(2*KF(i-1,3))+KF(i-1,4));
    Z(i)=Z(i-1)+(1/6)*(KG(i-1,1)+(2*KG(i-1,2))+(2*KG(i-1,3))+KG(i-1,4));
  endfor
  format short
  disp('      K1F       K2F       K3F      K4F')
  disp(KF)
  disp("\n\n")
  disp('      K1G       K2G       K3G      K4G')
  disp(KG)
  
  Tabla_de_Resultados(:,1)=T;
  Tabla_de_Resultados(:,2)=Y;
  Tabla_de_Resultados(:,3)=Z;
  
  disp("\n\n")
  disp('      T         Y        Z')
  disp(Tabla_de_Resultados)
  
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Disparo(f,g,h,a,b,ya,yb) %%DUDAS DE SU PRECISION
  syms x
  auxf=char(f);
  F=inline(auxf);
  auxg=char(g);
  G=inline(auxg); 
  d1=yb-(yb*0.5);
  Yb(1)=Sistema_2_ec_RK4(g,f,h,a,b,d1,ya,b);
  if(Yb(1)<yb)
  d2=yb+(yb*0.5);
  else
  d2=d1-(d1*0.5);
  endif
  
  Yb(2)=Sistema_2_ec_RK4(g,f,h,a,b,d2,ya,b);
  
  
  d3=d1+(((yb-Yb(1))/(Yb(2)-Yb(1)))*(d2-d1));
  [Yb(3),Tabla]=Sistema_2_ec_RK4(g,f,h,a,b,d3,ya,b);
  clc
  d1,d2,d3
  Yb
  disp("\n")
  disp('      T         Z        Y')
  disp(Tabla)
  hold on
  plot(Tabla(:,1),Tabla(:,3))
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=EDP_Hiperbolica(f,g,h,k,c,T0,Tf,X0,Xf,u0,uf)
  syms x
  auxf=char(f);
  F=inline(auxf);
  auxg=char(g);
  G=inline(auxg); 
  
  r=(c*k)/h;
  nx=((Xf-X0)/h)+1;  %numero de filas y de Xk   
  nt=((Tf-T0)/k)+1; 
  X(1)=X0;
  T(1)=T0;
  Fi(1)=F(X(1));
  Gi(1)=G(X(1));
  for i=2:nt
    T(i)=T0+(k*(i-1));
    U(i,1)=u0;
    U(i,nx)=uf;
  endfor
  for i=2:nx
    X(i)=X0+(h*(i-1));
    Fi(i)=F(X(i));
    Gi(i)=G(X(i));
  endfor
  U(1,:)=Fi;
  for i=2:nx-1
    U(2,i)=((1-(r^2))*U(1,i))+(((r^2)/2)*(Fi(i+1)+Fi(i-1)))+k*Gi(i);
  endfor  
  
  
  for j=2:nt-1
    for i=2:nx-1
      U(j+1,i)=(2-2*(r^2))*U(j,i)+(r^2)*(U(j,i-1)+U(j,i+1))-U(j-1,i);
    endfor
  endfor
  Tabla(1,1)=NaN;
  Tabla(1,2:nx+1)=X;
  Tabla(2:nt+1,1)=T;
  Tabla(2:nt+1,2:nx+1)=U;
  r
  Tabla
  
  figure
  for j=1:nt
    hold on 
    plot(X,U(j,:));
  endfor
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=EDP_Parabolica_I(f,h,k,K,t0,tf,x0,xf,T0,Tf)   %recomendado usar el programa individual de este metodo
  %metodo implicito
  auxf=char(f);
  F=inline(auxf); 
  r=(K*k)/(h^2);
  nx=((xf-x0)/h)+1;  %numero de columnas de X  
  nt=((tf-t0)/k)+1;  %numero de filas y de T 
  X(1)=x0;
  T(1)=t0;
  
    for i=2:nx
    X(i)=x0+(h*(i-1));
  endfor
  
  for i=1:nx
    U(1,i)=F(X(i));
  endfor

  A=eye((nx-2))*(2*r+1);
  
  
  for j=1:nx-2
    for i=1:nx-2
      if(i~=j)
      if(abs(i-j)==1)
      A(j,i)=-r;
      endif
      endif
    endfor
  endfor  
  U(:,1)=T0;
  U(:,nx)=Tf;
  B(:,1)=U(1,2:nx-1);
  B(1,1)=U(1,2)+r*U(1,1);
  B(nx-2,1)=U(1,nx-1)+r*U(1,nx);
  
  for j=1:nt-1
    for i=1:nx-2
      U(j+1,2:nx-1)=A\B(:,1);
      B(:,1)=U(j,2:nx-1);
      U(:,1)=T0;
      U(:,nx)=Tf;
      B(1,1)=U(j,2)+r*U(j,1);
      B(nx-2,1)=U(j,nx-1)+r*U(j,nx);
    endfor
  endfor
format short
U
figure
surf(U)
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=EDP_Parabolica_E(f,h,k,K,t0,tf,x0,xf,T0,Tf)% recomendado usar el programaindividual de este metodo.
  % metodo explicito
  auxf=char(f);
  F=inline(auxf); 
  r=(K*k)/(h^2);
  nx=((xf-x0)/h)+1;  %numero de filas y de Xk   
  nt=((tf-t0)/k)+1; 
  X(1)=x0;
  for i=2:nx
    X(i)=x0+(h*(i-1));
  endfor
  for i=1:nx
    U(1,i)=F(X(i));
  endfor
  
  for j=1:nt-1
    for i=2:nx-1
      U(j+1,i)=((1-2*r)*U(j,i))+(r*(U(j,i-1)+U(j,i+1)));
    endfor
  endfor
figure
surf(U)
endfunction
%%
