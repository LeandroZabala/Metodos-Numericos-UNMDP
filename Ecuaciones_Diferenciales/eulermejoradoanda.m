clear all
clc
syms x y z
%f=-9.8-(y^2)/55
%f=function_handle(f)
%f = @(x,y)(-y + sin(2*pi*x));
f = @(x,y)(-0.11*9.8-0.002*y^2)/0.11;     % ecuacion diferencial
%f=@(x,y)(2*y/x)+(x.^2)*(e.^x); %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
x0=input('\n Enter initial value of x i.e. x0: '); %example x0=0
y0=input('\n Enter initial value of y i.e. y0: '); %example y0=0.5
xn=input('\n Enter the final value of x: ');% where we need to find the value of y 
                                            %example x=2
h=input('\n Enter the step length h: '); %example h=0.2
 %Formula: y1=y0+h/2*[f(x0,y0)+f(x1,y1*)] where y1*=y0+h*f(x0,y0);
 
n=(xn-x0)/h;
Xvect=zeros(1,n);
Yvect=zeros(1,n);
fprintf('\n x        y'); 
Xvect(1,1)=x0;
Yvect(1,1)=y0;
i=1;
while x0<=xn
   
    fprintf('\n%4.5f   %4.5f ',x0,y0);%values of x and y
    k=y0+h*f(x0,y0);  % K seria el Yestrellita
    x1=x0+h;
    Xvect(1,i+1)=x1;  %Xvect va almacenando los valores de x
    y1=y0+h/2*(f(x0,y0)+f(x1,k));  % y1 es el valor de y con euler mejorado
    Yvect(1,i+1)=y1;     
    x0=x1;
    y0=y1; 
    i=i+1; 
end
l=size(Xvect);
l=l(1,2);
hold on
plot(Xvect(1,1:l-1), Yvect(1,1:l-1));