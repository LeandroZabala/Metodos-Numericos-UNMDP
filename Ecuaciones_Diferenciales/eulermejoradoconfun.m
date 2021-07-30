clear all
clc
syms x y t


F=(x-y)/2;
fsol=3.*e.^(-x./2)-2+x;
f=F;
f=function_handle(f);
fsol=function_handle(fsol);
%f=@(x,y)(x-y)/2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
%fsol = @(x)3*e^(-x/2)-2+x;   % solucion a la ecuacion diferencial

x0=input('\n Enter initial value of x i.e. x0: '); %example x0=0
y0=input('\n Enter initial value of y i.e. y0: '); %example y0=0.5
xn=input('\n Enter the final value of x: ');% where we need to find the value of y 
                                            %example x=2
                                            
h=input('\n Enter the step length h: '); %example h=0.2
%Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);

n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
fprintf('\n x        y(euler)     y(analitica))        f(analitica)-y(euler)'); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
i=1;
while x0<=xn
    fprintf('\n%4.5f   %4.5f      %4.5f                %4.5f',x0,y0,fsol(x0), fsol(x0)-y0);%values of x and y
    k=y0+h*f(x0,y0);
    x1=x0+h;
    y1=y0+h/2*(f(x0,y0)+f(x1,k)); 
    Yvect(1,i+1)=y1;   
    x0=x1;
    y0=y1;
    i=i+1;
end
l=size(Xvect);
l=l(1,2);
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));
hold on
XX=linspace(x0, xn);
l=size(XX);
l2=l(1,2);
for i=1:l2
  YY(1,i)=fsol(XX(1,i));
end
plot(XX,YY)