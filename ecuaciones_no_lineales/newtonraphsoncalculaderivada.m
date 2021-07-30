clear all;
clc;
f="(1+((x+1.75)/(x^2+4.6*x))*(6.15/(x^2+1.7*x+3.4)))"
ciclomax=30;
tolerancia=(10^(-4));

xanterior=0;
dx=0.0000001
x=-5;


n=0;
   
   while (n < ciclomax)&((abs(x-xanterior))>tolerancia)
     
      a=x;
      fx=eval(f);
      x=x+dx;
      fdx=eval(f);
      x=a;
      fprima=((fdx-fx)/dx)
      
      xanterior=x;
       
      x=xanterior-(fx/fprima);
       
       n=n+1;
            
    endwhile
disp('cantidad de cicls necesarios=')  
disp(n)
format long
disp('solucion')
disp(x)
