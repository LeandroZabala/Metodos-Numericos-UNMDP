M=[0.95 0.76 0.62 0.40 0.06;
   0.23 0.45 0.79 0.94 0.35;
   0.60 0.02 0.92 0.92 0.81;
   0.49 0.82 0.74 0.41 0.01;
   0.89 0.44 0.1 0.89 0.14]
disp(' Multiplique la matriz M cinco veces por s´ı misma.')
a=M^5
disp('Multiplique los elementos de M por si mismos cinco veces')
b=M.^5
z=[3 12 8 9 17; 
   28 37 66 21 57; 
   42 11 0 -25 23; 
   72 -24 75 68 -9;
   63 27 -43 23 77];
disp(' Obtenga la ra´ız cuadrada W de la matriz Z del ejercicio 4 (W*W = Z).')
w=sqrt(z)
comprobacion=w*w