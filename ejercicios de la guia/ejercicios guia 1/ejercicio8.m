v = [1.32 -4.23 7.25 0.42 9.38 -0.76 3.54 4.92 2.17 -3.38];
plot(v)
figure(2);
plot(v,'*')
x = [0.0 0.5 1.0 1.5 2.0 2.5 3.0];
y = [0.00 0.48 0.84 1.00 0.91 0.60 0.14];
figure(3);
plot(x,y)
disp('Grafique los valores de la funci´on coseno desde -π hasta π a pasos de π/10.');
figure(4);
x=-pi:pi/10:pi;
y=sin(x);
plot(x,y)
disp('Grafique la funcion log(x) desde 1 hasta 20 a pasos de 0.1. Agregue un tıtulo al grafico y') 
disp('etiquetas a los ejes.')
x=(1:0.1:20);
y=log(x);
figure(5)
plot(x,y)
disp('Superponga al gr´afico anterior la funci´on y = 3x + 1 y grafique.')
xlog=(1:0.1:20);
ylog=log(x);
xrecta=xlog;
yrecta=3*xlog+1;
figure(6)
plot(xlog, ylog, ";logaritmo;", xrecta, yrecta, ";recta;")

