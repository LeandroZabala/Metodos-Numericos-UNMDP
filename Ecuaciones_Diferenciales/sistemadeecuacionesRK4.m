% Runge kutta para sistemas de ecuaciones
clear all;
clc;

% definimos las funciones
fR=@(t,R,F) 0.4*R-0.02*F*R;
fF=@(t,R,F) 0.001*F*R-0.03*F

% condiciones iniciales:
t(1)=0;
R(1)=30;
F(1)=3;

% ancho de paso
h=0.2;
tfinal=500;
N=ceil(tfinal/h);

%Update loop
for i=1:N
  %acualizar tiempo
  t(i+1)=t(i)+h;
  %actualizar R y F
  K1R=fR(t(i)     ,R(i)     ,F(i));
  K1F=fF(t(i)     ,R(i)     ,F(i));
  K2R=fR(t(i)+h/2, R(i)+(h/2)*K1R, F(i)+h/2*K1F);
  K2F=fF(t(i)+h/2, R(i)+(h/2)*K1R, F(i)+h/2*K1F);
  K3R=fR(t(i)+h/2, R(i)+(h/2)*K2R, F(i)+h/2*K2F);
  K3F=fF(t(i)+h/2, R(i)+(h/2)*K2R, F(i)+h/2*K2F);
  K4R=fR(t(i)+h,   R(i)+h*K3R,     F(i)+h*K3F  );
  K4F=fF(t(i)+h,   R(i)+h*K3R,     F(i)+h*K3F  );
  R(i+1)=R(i)+(h/6)*(K1R + 2*K2R + 2*K3R + K4R);
  F(i+1)=F(i)+(h/6)*(K1F + 2*K2F + 2*K3F + K4F);
end
figure(1);
clf(1);
plot(t,R)
hold on
plot(t,F)
legend({'R','F'} , 'Location','northwest')

