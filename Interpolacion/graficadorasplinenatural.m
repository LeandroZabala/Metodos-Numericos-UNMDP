abcd=zeros(n+1, 4);
abcd(:,1)=d;
abcd(:,2)=c;
abcd(:,3)=b;
abcd(:,4)=a;
abcd1=abcd(1:n ,:);
pp=mkpp(x, abcd1);
xx=linspace(x(1,1), x(1,n+1));
yy=ppval(pp,xx);


hold on
plot(xx,yy)
plot(x,a,'.r','markersize',20)

#de aca en adelante es un intento fallido de hacer lo mismo para newton
coefidesordenado=coeffs(polnew)
coefiordenado=fliplr(coefidesordenado)
ppnewton=mkpp(x, coefiordenado')
xxnewton=linspace(x(1,1), x(1,n+1));
yynewton=ppval(ppnewton,xx);
hold on
plot(xxnewton,yynewton)
plot(x,y,'.r','markersize',20)