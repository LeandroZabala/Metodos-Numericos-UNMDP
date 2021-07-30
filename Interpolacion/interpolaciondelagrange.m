#interpolacion de lagrange
clc
clear all
x=[1 2 3 4]
y=[120.8 94 82.1 75.2]

n1=length(x);
L=zeros(n1,n1);
for i=1:n1
    v=1;
    for j=1:n1
        if i~=j
            v=conv(v,poly(x(j)))/(x(i)-x(j));
        end 
    end
    L(i,:)=v;
end
disp('coeficientes del polinomio de kagrange en orden descendente:')
disp('ej: a1*x^3 + a2*x^2 + a3*x + a4')
format long
#format short
#format shortEng
C=y*L
