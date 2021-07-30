a=3
b=4
f="e^(6*x/(x+1))+log(x+1)-100"
ciclomax=20
tolerancia=(10^(-4))

x=a;
fa=eval(f);
x=b;
fb=eval(f);
  if (fa<0)&(fb>0)
    n=1;
    xanterior=0;
    
       while (n < ciclomax)&(abs(eval(f))>tolerancia)%&((abs(x-xanterior))>tolerancia))
            x=(a+b)/2;
            y=eval(f);
     
                if (y < 0)
                  a=x;
                else
                   if (y > 0)
                       b=x;
                 else
                       sol=x;
                       disp('salto')
                       break
                  endif 
                endif
             n=n+1;
             xanterior=x;
        endwhile
        
    error=(b-a)/2
    sol=x
    fdesol=eval(f)
    n
   else
    disp('intervalo no valido!')
  endif
   
