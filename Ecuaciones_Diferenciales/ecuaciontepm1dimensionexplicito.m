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

uij=zeros(longt, longx);
%------------condiciones iniciales------------------
fi(1)=0;
fi(longx)=0;
ui1(longx,1)=0;
%----------------------------------------------------


for i=2:longx-1
  fi(i)= ecuacion(x(i));
  uij(1,i)=fi(i);
end


for i=2:longt
  for j=2:longx-1
    uij(i,j)=r*(uij(i-1,j+1)+uij(i-1, j-1))+(1-2*r)*uij(i-1,j);
  end
end
uij
