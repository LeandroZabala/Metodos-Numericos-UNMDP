function [poli]=SplineCubicoN(X,Y) %n de natural
  n=length(X);
  plot(X,Y)
    for i=1:n-1
     
       h(i)=X(i+1)-X(i);
     
    end
    A=zeros(n,n);
    A(1,1)=1;
    A(n,n)=1;
    sum=2; 
    B=zeros(n,1);
    B(1,1)=0;
    B(n,1)=0;
  
    for i=2:n-1 
                          %armo matriz A
        A(i,sum-1)=h(i-1);
        A(i,sum)=(2*(h(i)+h(i-1)));
        A(i,sum+1)=h(i);
        sum=sum+1;
                           %armo matriz B
        termino1=(3*(Y(i+1)-Y(i)))/h(i);%a=f(xi)---->a=yi
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
  
  
  syms x;
  

    for i=1:n-1 %armado de polinomios finales
        fprintf ('polinomio:')
        disp(i)
        p=(Y(i)+(b(i)*(x-X(i)))+(c(i)*((x-X(i))^2))+(d(i)*((x-X(i))^3)));
        poli=simplify(vpa(p,4))
        
      
         ezplot(poli,[X(i) X(i+1)]) 
         hold on
    
    end
    hold off
     
end