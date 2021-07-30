
clear all
clc
pkg load symbolic
syms x
X=[1 1.05 1.07 1.1]
Y=[2.718282 3.286299 3.527609 3.905416]
F=3*x*e^x-2*e^x   % funcion F(x)
Dfdx=diff(F,1)  % derivada de la funcion F
Fderiv = function_handle (Dfdx);

  n=length(X);
  plot(X,Y)
    for i=1:n-1
     
       h(i)=X(i+1)-X(i);
     
    end
    A=zeros(n,n);
    A(1,1)=2*h(1);      % elemento 1,1 de A es 2*h0
    A(n,n)=2*h(n-1);      % elemento n,n de A es 2*h(n-1)
    A(1,2)= h(1);
    A(n, n-1)= h(n-1);
    sum=2; 
    B=zeros(n,1);
    B(1,1)=((3/h(1))*(Y(1,2)-Y(1,1))-(3*Fderiv(X(1,1))));
    B(n,1)=(3*Fderiv(X(1,n)))-(3/h(n-1))*(Y(1,n)-Y(1,n-1));
  
    for i=2:n-1 
                          %armo matriz A
        A(i,sum-1)=h(i-1);
        A(i,sum)=(2*(h(i)+h(i-1)));
        A(i,sum+1)=h(i);
        sum=sum+1;
                           %armo matriz B
        termino1=(3*(Y(i+1)-Y(i)))/h(i);      %a=f(xi)---->a=yi
        termino2=(3*(Y(i)-Y(i-1)))/h(i-1);
        B(i)=termino1-termino2;
    end
  A
  B
                        %cálculo de c
    [L,U,P] = lu(A);
     c=U\(L\P*B);
  c

    for i=1:n-1
        termino1=((Y(i+1)-Y(i))/h(i));
        termino2=((h(i)/3)*(2*c(i)+c(i+1)));
        b(i)= termino1-termino2; %armo b
        d(i)=(c(i+1)-c(i))/(3*h(i)); %armo d
    end
  b
  d
    

    for i=1:n-1 %armado de polinomios finales
        fprintf ('polinomio:');
        disp(i)
        p=(Y(i)+(b(i)*(x-X(i)))+(c(i)*((x-X(i))^2))+(d(i)*((x-X(i))^3)));
        poli(i,1)=simplify(vpa(p,4));
        disp(poli(i,1))
        
      
         ezplot(poli(i,1),[X(i) X(i+1)]) 
         hold on
    
  end
  
    hold off
  fprintf ('\n lista de polinomios cubicos: \n:');
  poli

  