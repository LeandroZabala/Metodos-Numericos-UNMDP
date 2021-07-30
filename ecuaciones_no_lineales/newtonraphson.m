clear all;
clc;
f="(3*x+sin(x)-e^x)"
fprima="(3+cos(x)-e^x)"
x=0
ciclomax=30;
tolerancia=(10^(-4));
xanterior=1;
n=0;
   
   while (n < ciclomax)&((abs(x-xanterior))>tolerancia)
       xanterior=x;
       x=xanterior-(eval(f)/eval(fprima));
       
       n=n+1;
            
    endwhile
disp('cantidad de cicls necesarios=')  
disp(n)
format long
disp('solucion')
disp(x)
