% Runge kutta para sistemas de ecuaciones
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

% ancho de paso
h=0.02;
tfinal=0.2;                              
N=ceil(tfinal/h);

fprintf('\n t        x           y     x(analitica)      y(analitica)     x(num)-x(analitica)      y(num)-y(analitica)'); 

fprintf('\n%4.3f   %4.6f    %4.6f    %4.6f       %4.6f         %4.6f                 %4.6f',t(1),x(1),y(1), fsolx(t(1)),fsoly(t(1)) ,(x(1)-fsolx(t(1))), (y(1)-fsoly(t(1)))  );%values of x and y
%Update loop
for i=1:N
  
  %acualizar tiempo           R=x  F=y
  t(i+1)=t(i)+h;
  %actualizar R y F
  K1x=f1(t(i)     ,x(i)     ,y(i));
  K1y=f2(t(i)     ,x(i)     ,y(i));
  K2x=f1(t(i)+h/2, x(i)+(h/2)*K1x, y(i)+(h/2)*K1y);
  K2y=f2(t(i)+h/2, x(i)+(h/2)*K1x, y(i)+(h/2)*K1y);
  K3x=f1(t(i)+h/2, x(i)+(h/2)*K2x, y(i)+(h/2)*K2y);
  K3y=f2(t(i)+h/2, x(i)+(h/2)*K2x, y(i)+(h/2)*K2y);
  K4x=f1(t(i)+h,   x(i)+h*K3x,     y(i)+h*K3y  );
  K4y=f2(t(i)+h,   x(i)+h*K3x,     y(i)+h*K3y  );
  x(i+1)= x(i)+(h/6)*(K1x + 2*K2x + 2*K3x + K4x);
  y(i+1)= y(i)+(h/6)*(K1y + 2*K2y + 2*K3y + K4y);
  fprintf('\n%4.3f   %4.6f    %4.6f    %4.6f       %4.6f        %4.6f                 %4.6f',t(i+1),x(i+1),y(i+1), fsolx(t(i+1)), fsoly(t(i+1)), (x(i+1)-fsolx(t(i+1))),(y(1)-fsoly(t(1))) );%values of x and y

end
figure(1);
clf(1);
plot(t,x)
hold on
plot(t,y)
xlabel('tiempo')
ylabel('y1 , y2')
set(gca, 'fontsize', 12)

