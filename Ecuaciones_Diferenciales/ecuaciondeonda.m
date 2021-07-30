h=0.1
k=0.04
c=2
tinicial=0
tfinal=5
posinicial=0
posfinal=1

f1=@(x) sin(pi*x)+sin(2*pi*x);   %posicion inicial
f2=@(x) 0;     %velocidad

r=(c*k/h)
tvect=(tinicial:k:tfinal);
x=(posinicial:h:posfinal);
longx=size(x);
longx=longx(1,2);
ivect=(0:1:longx-1);
longt=size(tvect);
longt=longt(1,2);

uij=zeros(longt, longx);

fi(1)=0;
gij(1)=0;
fi(longx)=0;
gij(longx)=0;
ui1(longx,1)=0;

for i=2:longx-1
  fi(i)=f1(x(i));
  gi(i)=f2(x(i));
  uij(1,i)=fi(i);
end

for i=2:longx-1
    uij(2,i)=(1-r^2)*fi(i)+((r^2)/2)*(fi(i-1)+fi(i+1))+k*gi(i);
end

for i=3:longt
  for j=2:longx-1
    uij(i,j)=(r^2)*(uij(i-1,j+1)+uij(i-1, j-1))+2*(1-r^2)*uij(i-1,j)-uij(i-2, j);
  end
end
uij;
surf(uij)



