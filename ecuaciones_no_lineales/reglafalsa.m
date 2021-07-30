clc
a=3
b=4
f="e^(6*x/(x+1))+log(x+1)-100"
ciclomax=25
tolerancia=(10^(-4))

x=a;
fa=eval(f);
x=b;
fb=eval(f);

if (fa<0)&(fb>0)
    n=0;
    xanterior=0;
    
   while (n < ciclomax)&((abs(eval(f))>tolerancia)&((abs(x-xanterior))>tolerancia))
            xanterior=x;
            x=a;
            fa=eval(f);
            x=b;
            fb=eval(f);
            x=((a*fb-b*fa)/(fb-fa));
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
    format long
    sol=x
    fdesol=eval(f)
   else
    disp('intervalo no valido!')
  endif
   
