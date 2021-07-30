% Runge kutta para sistemas de ecuaciones
clear all;
clc;

% definimos las funciones

%f1=@(t,x,y) 10/m;     %dy/dt
%f2=@(t,x,y) (10/m)*t  %dx/dt

f2=@(t,x,y) x
f1=@(t,x,y) -2*x-y    


% condiciones iniciales:
t(1)=0;
x(1)=5;
y(1)=1;

% ancho de paso
h=0.1;
tfinal=1;
N=ceil(tfinal/h);

fprintf('\n t        x           y'); 

fprintf('\n%4.3f   %4.6f    %4.6f',t(1),x(1),y(1));%values of x and y
%Update loop
for i=1:N
  
  %acualizar tiempo       
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
  fprintf('\n%4.3f   %4.6f    %4.6f',t(i+1),x(i+1),y(i+1));%values of x and y

end
figure(1);
clf(1);
plot(t,x)
hold on
plot(t,y)
xlabel('tiempo')
ylabel('y1 , y2')
legend({'Y1','Y2'} , 'Location','northwest')


