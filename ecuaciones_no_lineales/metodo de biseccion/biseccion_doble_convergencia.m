clc
a=0
b=1
f="log(x^2+1)-e^(x/2)*cos(pi*x)"
ciclomax=30
tolerancia=(10^(-6))

x=a;
fa=eval(f);
x=b;
fb=eval(f);

  if (fa<0)&(fb>0)
    n=1;
    xanterior=0;
    
       while (n < ciclomax)&((abs(eval(f))>tolerancia)&((abs(x-xanterior))>tolerancia))
            xanterior=x;
            x=(a+b)/2;
            y=eval(f);
            
                if (y < 0)
                  a=x;
                else
                   if (y > 0)
                       b=x;
                 else
                       sol=x;
                       disp('solucion exacta encontrada!')
                       break
                  endif 
                endif
             n=n+1;
            
        endwhile
    disp('cantidad de cicls necesarios=')  
    disp(n)
    error=(b-a)/2
    format long 
    sol=x
    fdesol=eval(f)
   else
    disp('intervalo no valido!')
  endif
   
