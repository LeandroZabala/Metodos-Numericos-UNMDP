f="(3*x+sin(x)-e^x)"
ciclomax=30;
tolerancia=(10^(-4));
#para el metodo de la tangente. ingrese 2 valores (x anteriror y x)
#los mismos no necesariamente deben incluir a la raiz
xanterior=0.1;
x=0.5;
n=0;
   
   while (n < ciclomax)&((abs(x-xanterior))>tolerancia)
     
      a=x;
      fx=eval(f);
      x=xanterior;
      fxanterior=eval(f);
      x=a;
      
      aproximacionfprima=((fx-fxanterior)/(x-xanterior))
      
      xanterior=x;
       
      x=xanterior-(fx/aproximacionfprima);
       
       n=n+1;
            
    endwhile
disp('cantidad de cicls necesarios=')  
disp(n)
format long
disp('solucion')
disp(x)
