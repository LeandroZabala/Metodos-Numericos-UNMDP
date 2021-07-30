function []=Euler_con_solucion(f,h,T0,Tf,y0)
% donde: f es la ecuacion diferencial dy/dt
% fsol es la solucion de la ecuacion diferencial y(t)=...
% h es el ancho de paso
% T0 es el valor inicial de t y Tf es el valor final (punto final del intervalo)
% y0 es el valor inicial de Y (Y(T0))
syms x y

F=(x-y)/2;
fsol=3.*e.^(-x./2)-2+x;

F=function_handle(F);
fsol=function_handle(fsol);

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