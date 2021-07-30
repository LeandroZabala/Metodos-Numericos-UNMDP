function[]=Sistema_3_ec_HEUNv2(fy,fz,fu,h,x0,xn,y0,z0,u0)
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
