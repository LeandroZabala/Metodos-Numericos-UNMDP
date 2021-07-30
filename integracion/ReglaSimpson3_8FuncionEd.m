clc;
clear all;

fprintf('Bienvenido, este programa usa la regla del simpson 3/8 para aproximar el valor de una integral definida:');
g='(sqrt(x))';
f=inline(g);
a=0.5;                  %Ingrese el extremo inferior de la integral
b=1;                  %Ingrese el extremo superior de la integral
n=1000;                %Ingrese cantidad de nodos (deben ser multiplos de 3)
k=n/3;
h=(b-a)/n;
A=0;
for i=1:k
    A=A+(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    a=a+3*h;
end

fprintf('El valor aproximado de la integral es: %f',A);
