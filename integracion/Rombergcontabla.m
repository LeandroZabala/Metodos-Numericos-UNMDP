% Este programa sirve para calcular el valor de ina integral a partir
% de 2 tablas de valores. Uno de X y otro de F(x). Los valores de la tabla de X
% deben estar espaciados uniformemente.
clear all;
clc;
X=[0 5 10 15 20  30  40];
Y=[0 32.066 44.873 49.989 52.032 53.174  53.356];

%X=[0 6 12 18 24 30 36 42 48 54 60 66 72 78 84 90 96]         % vector que contiene los valores de x
%Y=[37.2 40.2 44.4 46.8 44.1 39.9 36.3 32.7 29.7 25.5 23.4 26.7 31.2 34.8 36.9 38.7 39.6] % vector que contiene los valores de Y
disp('limite inferior de integracion (debe pertenecer al vector X)')
liminf=0                                                              % limite inferior 
disp('limite superior de integracion (debe pertenecer al vector X)')
limsup=40                                                       % limite superior
xliminf=find(X==liminf);                                        % encuentro el limite inferior en el vector X
xlimsup=find(X==limsup);                                        % encuentro el limite superior en el vector X
cantpuntos=xlimsup-xliminf+1;                                   % calculo la cantidad de puntos que tiene la tabla entre el limite superior y el inferior
k=log2(cantpuntos-1)+1;                                         % calcula k la cantida de veces que puedo aplicar el metodo
ha=(limsup-liminf);                                             % calculo el primer valor de h (ancho de paso)
Rant=((limsup-liminf)/2)*(Y(xlimsup)+Y(xliminf));               % calculo la primer aproximacion
R=zeros(k,1);                                                   % creo un vector el el que se almacenaran todas las aproximaciones sucesivas
R(1,1)=Rant;                                                    % lleno el primer elemento de la matriz de aproximaciones con la primer aproximacion
h=zeros(k,1);                                                   % creo un vector en donde se almacenaran los distintos h (ancho de paso)
h(1,1)=ha;                                                      % lleno el primer elemento de la metriz de ancho de pasos con el primer valor de h
for i=2:k
  sumatoria=0;
  for i2=1:(2^(i-2))
    xmed=liminf+(((2*i2-1)/2)*h(i-1,1));                        % calculo el valor en el que se tiene que especializar la funcion (en este caso se busca el valor en la tabla)
    lugar=find(X==xmed);                                        % busco xmed en el vector X
    fx=Y(1,lugar);                                              % fx es el valor f(xmed)
    sumatoria=sumatoria+fx;
  end
  R(i,1)=0.5*(R(i-1,1)+h(i-1,1)*sumatoria);                      % se almacena la aproximacion en su correspondiente lugar
  h(i,1)=h(i-1,1)/2;
end
disp('resultados de la integral a medida que se vuelve a repetir el metodo')
disp(R)                                                          % se muestra el vector con las distintas aproximaciones logradas