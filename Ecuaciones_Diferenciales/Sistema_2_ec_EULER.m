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