% metodo para encontrar polinomios or cuadrados minimos
clc;
clear all; #si eliminamos clear all, podemos cambiar n y superponer graficas
n=1
X=[1 2 5 10 20 30 40]
Y=[56.5 78.6 113 144.5 181 205 214.5]
m=size(X);
est=m(1,2);
P=polyfit(X,Y,n)
X1=linspace(X(1,1), X(1,est));
Y1=polyval(P,X1);

plot(X,Y,'.r','markersize',20)
hold on
plot(X1,Y1)
sum=0;

for i=1:est
 diferencia=(Y(1,i)-polyval(P,X(1,i)))^2;
 sum= sum+diferencia;
end
varianza=sum/(est-n-1)

