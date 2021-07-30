clc
pkg load symbolic
X1=[0 2 5 8 10 14 16]
Y1=[25 100 150 200 250 270 350]
Xe=[12];


function []=Graficos(X1,Y1,Xe)
if length(X1)>3 
  [Rlagrange,polinomioL,XXlagrange,YYlagrange]=lagrange(X1,Y1,Xe);
  [Rnewton,polinomioN,DD,XXnewton,YYnewton] = newton(X1, Y1,Xe);
  [Rminimos,polinomioM,coeficientes,matvar,XXmin,YYmin] = mincuad(X1,Y1,Xe);
  [Rspline,PP,polinomioS,XXspline,YYspline]=sspline(X1, Y1,Xe);

  hold on;
  plot(XXlagrange,YYlagrange);
  plot(XXnewton,YYnewton);
  plot(XXspline,YYspline);
  plot(XXmin, YYmin);
  plot(X1,Y1,'.r','markersize',20);
  title('distintas aproximaciones e interpolaciones')
  legend({'lagrange','newton','spline','mincuad 1'},'Location','southwest')
  
else
  [Rlagrange,polinomioL,XXlagrange,YYlagrange]=lagrange(X1,Y1,Xe);
  [Rnewton,polinomioN,DD,XXnewton,YYnewton] = newton(X1, Y1,Xe);
  [Rminimos,polinomioM,coeficientes,matvar,XXmin,YYmin] = mincuad(X1,Y1,Xe);
  
  
  hold on;
  graficoL = plot(XXlagrange,YYlagrange);
  set(graficoL,'Color','red','LineWidth',1)
  legend(graficoL,'Lagrange')

  graficoN = plot(XXnewton,YYnewton);
  set(graficoN,'Color','blue','LineWidth',1)
  legend(graficoN,'Newton')
  
  for i=1:length(X1)-1
    hold on;
    subplot(2,2,4)
    graficoM = plot(XXmin,YYmin(i,:));
    set(graficoL,'Color','red','LineWidth',1)
    legend(graficoM,'Min. Cuad.')
  endfor
  hold off;
  clc
endif
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=Tabla(X1,Y1,Xe)
Rlagrange=lagrange(X1, Y1,Xe);
Rspline=linspace(0,0,length(Xe));
Rnewton=newton(X1, Y1,Xe);
Rminimos=mincuad(X1,Y1,Xe);

if length(X1)>3 
  Rspline=sspline(X1,Y1,Xe);
endif
clc
disp("Tabla de aproximaciones: \n")
titulos=["   Valores" "   Lagrange" "   Spline" "   Newton" "   Min. Cuad."];
tabla(:,1)=Xe;
tabla(:,2)=Rlagrange;
tabla(:,3)=Rspline;
tabla(:,4)=Rnewton;
tabla(:,5)=Rminimos;
disp(titulos)
disp(tabla)
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Rlagrange,polinomioL,XXlagrange,YYlagrange]=lagrange(X1,Y1,Xe)
syms x
for i=1:length(X1)
  T=1;
  for k=1:length(X1)
    if(k~=i)
      T=T.*(x-X1(k));
    endif
      
  end
  b=char(T);
  f=inline(b);
  n=feval(f,X1(i));
  T=T/n;
  F(i)=T;
end

for i=1:length(Xe)
  p(i)=0;
  for k=1:length(X1)
    b=char(F(k));
    f=inline(b);
    L(k)=feval(f,Xe(i));
    p(i)=p(i)+(Y1(k)*L(k));
  end
end

polinomioL=0;
for i=1:length(X1)
G(i)=(F(i).*Y1(i));
polinomioL=polinomioL+G(i);
end
clc

b=char(polinomioL);
f=inline(b);
XXlagrange=linspace(X1(1), X1(length(X1)));
for i=1:length(XXlagrange)
  YYlagrange(i)=f(XXlagrange(i));
end

disp('Polinomio armado')
disp(polinomioL)
disp('Polinomio armado simplificado')
disp(simplify(polinomioL))
disp('Resultados de aproximaciones Xe')
Rlagrange=transpose(p);
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Rspline,PP,polinomioS,XXspline,YYspline]=sspline(X1, Y1,Xe)
syms x
syms Xk
n=length(X1)-1;
PP=spline(X1, Y1);
XXspline=linspace(X1(1), X1(length(X1)));
YYspline=ppval(PP, XXspline);

for i=1:n
  for k=2:4
  t=PP.coefs(i,k)*((x-Xk)^(k-1));
  polinomioS(i,k)=t;
  endfor
  polinomioS(i,1)=PP.coefs(i,1);
endfor
 
for i=1:length(Xe)
Rspline(i,1)=ppval(PP, Xe(i));
endfor
clc
disp('Coeficientes como float de grado en orden ascendente ')
disp(PP.coefs)
disp('Polinomios armados')
disp(polinomioS)
disp('Resultados de aproximaciones Xe')
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Rnewton,polinomioN,DD,XXnewton,YYnewton] = newton(X1, Y1,Xe)
syms x;
n=length(X1)-1;
DD=zeros(n+1);    %creo una matriz cuadrada de ceros
DD(:,1)=Y1;        %lleno la primer columna de DD con los elementos de Y

% calculo la matriz de diferencias divididas
for k=2:n+1       
    for J=k:n+1
        DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X1(J)-X1(J-k+1)];
    end
end


polnew=DD(1,1);
P=1;
for i=1:n
    P=P*(x-X1(i));
    polnew=polnew+P*DD(i+1,i+1);
end

polnew=expand(polnew);
pretty(polnew);
polinomioN=vpa(polnew, 5);
b=char(polinomioN);
f=inline(b);
XXnewton=linspace(X1(1), X1(n+1));

for i=1:length(XXnewton)
  YYnewton(i)=f(XXnewton(i));
end

for i=1:length(Xe)
Rnewton(i)=f(Xe(i));
endfor


clc
disp('La matriz de diferencias divididas es:');
disp(DD);
disp('El polinomio de newton es');
disp(polinomioN)
disp('Resultados de aproximaciones Xe')
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Rminimos,polinomioM,coeficientes,matvar,XXmin,YYmin] = mincuad(X1,Y1,Xe)
syms x
m=length(X1);
n=m-1;
CM=zeros(n,m+1);
matvar=zeros(n,2);

XXmin=linspace(X1(1,1), X1(1,m));
m2=length(XXmin);
YYmin=zeros(n,m2);
for i=1:n
  sum=0;
  P=polyfit(X1,Y1,i);
  
  for i2=1:i+1
    zeros(i,i2)=P(1,i2);
  endfor

  for i3=1:m
    diferencia=((Y1(1,i3)-polyval(P,X1(1,i3)))^2);
    sum= sum+diferencia;
  endfor
  
  varianza=sum/(m-i-1);
  matvar(i,1)=i;
  matvar(i,2)=varianza;
  YYmin(i,:)=polyval(P,XXmin);
endfor
  polinomioM=0;
  for i=1:n
  polinomioM=polinomioM+P(i)*x^(i);
  endfor
  polinomioM=polinomioM+P(length(P));
  
  Rminimos(:,1)=polyval(P,Xe);

  
  
 clc
  disp('ordenados de forma descendente. ax+b en el segundo renglon ax^2+b*x+c')
  disp('el ultimo polinomio es de interpolacion')
  coeficientes=zeros
  for i=1:n
     fprintf("\n varianzadel polinomio de orden %1.0g : %5.6g \n", matvar(i,1), matvar(i,2) )
  endfor
  matvar
  disp('Polinomio interpolacion armado')
  disp(polinomioM)
  disp('Resultados de aproximaciones Xe')
endfunction