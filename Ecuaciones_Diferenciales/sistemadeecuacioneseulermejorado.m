
% resuelve sistemas de ecuaciones por euler
clear all;
clc;

% definimos las funciones
f1=@(t,x,y) x+2*y;
f2=@(t,x,y) 3*x+2*y
fsolx = @(t)(4*e^(4*t)+2*e^(-t));   % solucion a la ecuacion diferencial
fsoly = @(t)(6*e^(4*t)-2*e^(-t));   % solucion a la ecuacion diferencial

% condiciones iniciales:
t(1)=0;
x(1)=6;
y(1)=4;

h=0.02;   % ancho de paso
tfinal=0.2;                              
N=ceil(tfinal/h);
                                            
%Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);

fprintf('\n t        x           y     x(analitica)      y(analitica)     x(num)-x(analitica)      y(num)-y(analitica)'); 
fprintf('\n%4.3f   %4.6f    %4.6f    %4.6f       %4.6f         %4.6f                 %4.6f',t(1),x(1),y(1), fsolx(t(1)),fsoly(t(1)) ,(x(1)-fsolx(t(1))), (y(1)-fsoly(t(1)))  );%values of x and y

for i=1:N
    k1=x(i)+h*f1(t(i),x(i),y(i));
    k2=y(i)+h*f2(t(i),x(i),y(i));  
    t(i+1)=t(i)+h;
    x(i+1)=x(i)+h/2*(f1(t(i), x(i) , y(i)) + f1(t(i+1), k1, k2));
    y(i+1)=y(i)+h/2*(f2(t(i), x(i) , y(i)) + f2(t(i+1), k1, k2));
    fprintf('\n%4.3f   %4.6f    %4.6f    %4.6f       %4.6f        %4.6f                 %4.6f',t(i+1),x(i+1),y(i+1), fsolx(t(i+1)), fsoly(t(i+1)), (x(i+1)-fsolx(t(i+1))),(y(1)-fsoly(t(1))) );%values of x and y

end
Xvect=t
Yvect=x
Zvect=y
%l=size(Xvect);
%l=l(1,2);
%plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
%hold on
%XX=linspace(x02, xn);
%l=size(XX);
%l2=l(1,2);
%for i=1:l2
%  YY(1,i)=fsol(XX(1,i));
%end
%plot(XX,YY)
plot(t,x)
hold on
plot(t,y)