function ReglaTrapecioFuncionEd
fprintf('Bienvenidos, este programa aproxima integrales con el método del trapecio \n');
g='sin(x)'
f=inline(g);
a=0;                  %Ingrese el extremo inferior de la integral
b=2;                  %Ingrese el extremo superior de la integral
n=8;                 %Ingrese la cantidad de trapecios a utilizar
h=(b-a)/n;
S=0;

for i=1:n
    S=S+(h/2)*(f(a)+f(a+h));
    a=a+h;
end

fprintf('El valor aproximado de la integral es: %f',S);
end