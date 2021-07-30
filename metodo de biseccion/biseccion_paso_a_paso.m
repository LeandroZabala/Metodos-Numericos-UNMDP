
clear all;
clc;
disp('INGRESAR LA FUNCION, INTERVALO DE EVALUACION Y PORCENTAJE DE ERROR'); 
Y= input('ingrese la funcion: ','s')
Xa= input('ingrese el intervalo inferior: '); 
Xb= input('ingrese el intervalo superiror: ');
error= input('ingrese el porcentaje de error: ');
x= Xa;
Ya= eval(Y);
x= Xb;
Yb= eval(Y);
if(Ya*Yb)>0
    fprintf('\n\n no existe raiz en el intervalo [Xa,Xb]\n\n');
    fprintf('ingrese un nuevo intervalo o una nueva funcion');
    else if (Ya*Yb)<0
      fprintf('\n\n'); %deja un renglon vacio
      disp('  N     Xa     Xb    Xr    F(Xa)    F(Xb)    F(Xr)     error    ');
      disp('|----|------|------|-----|-------|---------|--------|---------|');
      Xant=0;
      N=0;
       while N<50
          Xr=(Xa+Xb)/2;
          Xact=Xr;
          x=Xr;
          Yr= eval(Y);
          Ea= abs((Xact-Xant)/Xact)*100;
          ds_i=fprintf('%4d %17.8g %17.8g %17.8g %17.8g %17.8g %17.8g 10.5g', N, Xa, Xb, Xr, Ya, Yb, Ea);
          disp(ds_i);
            if Ea<error
              fprintf('\n\n La raiz exacta es: %d', Xr);
              fprintf('\n\n numero de iteraciones: %d \n\n', N);
               break
             end
             if(Ya*Yr)<0
                Xb=Xr;
             elseif (Ya*Yr)==0
                 fprintf('\n\n la raiz exacta es: %17.8g',Xr);
                 fprintf('\n\n el numero de iteraciones fue %d', N);
                 break
               else
                  Xa=Xr;
              end
           Xant=Xr;
           N=N+1;
        end
    
  end
end