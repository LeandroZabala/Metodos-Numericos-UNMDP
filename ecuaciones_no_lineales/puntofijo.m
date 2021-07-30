clc
x=2
g="((x^5+1)/12)"
ciclomax=30;
tolerancia=(10^(-5))
xanterior=0;
n=0;
    
   while (n < ciclomax)&((abs(x-xanterior))>tolerancia)
       xanterior=x;
       x=eval(g);
       
       n=n+1;
            
    endwhile
disp('cantidad de cicls necesarios=')  
disp(n)
format long
disp('solucion')
disp(x)
