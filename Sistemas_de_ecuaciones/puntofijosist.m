% METODO DE PUNTO FIJO PARA SISTEMAS DE ECUACIONES NO LINEALES

clear all;
clc;
pkg load symbolic;
pkg load signal;

syms x y;
f1= x^2+y^2-4     %f1(x,y)=0
f2= e^x+y-1     %f2(x,y)=0
g1=-sqrt(4-y^2)
g2=1-e^x

% a continuacion grafico y busco un punto para encontrar el entorno D
ezplot(f1, [-10, 10])   % grafico f1=0
hold on
ezplot(f2, [-10, 10])    % grafico f2=0
Dx=input('ingrese el entorno D(a,b)/ a<x<b');
D1x=Dx(1,1)
D2x=Dx(1,2)
Dy=input('ingrese el entorno D(a,b)/ a<y<b');
D1y=Dy(1,1)
D2y=Dy(1,2)
hold off

dg1dx=diff(g1,x)
dg1dy=diff(g1,y)
dg2dx=diff(g2,x)
dg2dy=diff(g2,y)

subplot(2,2,1)
ezplot(dg1dx, [D1x, D2x])
title('dg1/dx')

subplot(2,2,2)
ezplot(dg1dy, [D1y, D2y])
title('dg1/dy')

subplot(2,2,3)
ezplot(dg2dx, [D1x, D2x])
title('dg2/dx')

subplot(2,2,4)
ezplot(dg2dy, [D1y, D2y])
title('dg2/dy')
% si las derivadas de g1 y g2 son continuas en el entorno D
% entonces existe al menos 1 punto fijo

puntosx= linspace(Dx1, Dx2, 200);
puntosx= linspace(Dy1, Dy2, 200);
