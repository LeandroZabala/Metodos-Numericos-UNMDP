clear all;
clc;

h=0.25           %ancho de paso de x
k=0.2            %ancho de paso de t
c=0.1515         %velocidad de propagacion / conductividad / etc
tinicial=0       %t0
tfinal=10         %tiempo final
posinicial=0     %posicion inicial
posfinal=2       %posicion final

r=(c*k/h^2)      %calculo de r
tvect=(tinicial:k:tfinal);
x=(posinicial:h:posfinal);
longx=size(x);
longx=longx(1,2);
ivect=(0:1:longx-1);
longt=size(tvect);
longt=longt(1,2);

mat=zeros(longx-2);
%------------condiciones iniciales------------------
fi(1)=0;
fi(longx)=0;
uij(1,longx)=fi(longx);
uij(1,1)=fi(1);
%----------------------------------------------------

%calculo las condiciones inicales
for i=2:longx-1
  fi(i)= ecuacion(x(i))
  uij(1,i)=fi(i);
end

mat(1,1)=1+2*r;
mat(1,2)=-r;
mat(longx-2,longx-2)=1+2*r;
mat(longx-2,longx-3)=-r;

for i=2:longx-3
 mat(i,i-1)=-r;
 mat(i,i)=1+2*r;
 mat(i,i+1)=-r;
end


for j=1:longt         %avanzo columnas
  uij(j,longx)=fi(longx); 
  uij(j,1)=fi(1);         
    for i=1:longx-2     %avanzo filas
       b(i)=uij(j,i+1);   %armo un vector b que contiene 1 fila de uij
    end                  
  t=mat\b';
  t=t';
  for i=2:longx-1
    uij(j+1,i)=t(i-1);
  end
end
uij

