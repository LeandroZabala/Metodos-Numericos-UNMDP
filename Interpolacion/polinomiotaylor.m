#este programa permite calcular un polinomio de aproximacion de taylor
clc;
clear all;
pkg load symbolic;
syms x      # x es la variable de mi funcion f(x)
f(x)=x*e^x-1    #f es la funcion a la que vamos a aproximar
n=5;             #es el orden del polinomio de aproximacion
x0=0;            #punto al que vamos a aproximar
aprox=0

for i = 0:n
  i
  derivada(x) = diff(f,i)
  p(x)=((derivada(x0))/factorial(i))*(x-x0)^(i)
  aprox=aprox+p(x)
endfor
ezplot(aprox, [0 2])      #grafica la funcion en el intervalo (0;2)
hold on
ezplot(f(x), [0 2])