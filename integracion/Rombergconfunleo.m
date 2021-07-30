% Este programa sirve para calcular el valor de ina integral a partir
% de su funcion.

clear all;
clc;
g='(68.1*9.8/12.5)*(1-e^((-12.5/68.1)*x))'
f=inline(g)
disp('limite inferior de integracion ')
liminf=0                                                             % limite inferior 
disp('limite superior de integracion ')
limsup=40                                                       % limite superior
k=9
ha=(limsup-liminf);                                             % calculo el primer valor de h (ancho de paso)
Rant=(ha/2)*(f(limsup)+f(liminf));                              % calculo la primer aproximacion
R=zeros(k,1);                                                   % creo un vector el el que se almacenaran todas las aproximaciones sucesivas
R(1,1)=Rant;                                                    % lleno el primer elemento de la matriz de aproximaciones con la primer aproximacion
h=zeros(k,1);                                                   % creo un vector en donde se almacenaran los distintos h (ancho de paso)
h(1,1)=ha;                                                      % lleno el primer elemento de la matriz de ancho de pasos con el primer valor de h
for i=2:k
  sumatoria=0;
  for i2=1:(2^(i-2))
    xmed=liminf+(((2*i2-1)/2)*h(i-1,1));                        % calculo el valor en el que se tiene que especializar la funcion
    fx=f(xmed);
    sumatoria=sumatoria+fx;
  end
 R(i,1)=0.5*(R(i-1,1)+h(i-1,1)*sumatoria);                      % se almacena la aproximacion en su correspondiente lugar
  h(i,1)=h(i-1,1)/2;
end
disp('resultados de la integral a medida que se vuelve a repetir el metodo')
% disp(R)                                                          % se muestra el vector con las distintas aproximaciones logradas
format long
disp(R(k,1))