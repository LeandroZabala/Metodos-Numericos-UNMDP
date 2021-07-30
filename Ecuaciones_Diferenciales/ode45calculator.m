%Dominio, rango en el cual se evaluará la variable independiente. 
dominio=[0 1];
%Condiciones iniciales
CI1=1;
CI2=0;
 
%Agupación de las condiciones iniciales
CI=[CI1 CI2];
 
%Cálculo de las soluciones
[isol, dsol]=ode45('funcionejercicio', dominio, CI);
 
% gráfico de las soluciones
plot(isol, dsol(:,1), 'k')% gráfico de la primera variable (x)
hold on
plot(isol, dsol(:,2), 'r')% gráfico de la primera variable (y)
legend('tx','ty')

function [dep_ind]=funcionejercicio(i,d)%definición de la función
%definición delas variables dependientes
x=d(1);
y=d(2);
%Definición de las funciones
dep_ind=[4*x+y;
    -2*x+y];
end
