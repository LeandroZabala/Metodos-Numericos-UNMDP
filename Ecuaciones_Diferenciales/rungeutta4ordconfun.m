clear all
clc
f=@(x,y)(2*y/x)+(x.^2)*(e.^x); %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
fsol = @(x)(x.^2)*(e.^(x)-e);   % solucion a la ecuacion diferencial

x0=input('\n Enter initial value of x i.e. x0: '); %example x0=0
y0=input('\n Enter initial value of y i.e. y0: '); %example y0=0.5
xn=input('\n Enter the final value of x: ');% where we need to find the value of y example x=2
h=input('\n Enter the step length h: '); %example h=0.2


a=xn-x0;
l=a/h;
Yvect=zeros(1,l+1);
Xvect=zeros(1,l+1);
Yvect(1,1)=y0;
Xvect(1,1)=x0;

fprintf('\n x        y(R-K 4to ord)     y(analitica))        f(analitica)-y(R-K)'); 

i=2;
while x0<=xn
    fprintf('\n%4.5f   %4.5f               %4.5f             %4.7f',x0,y0,fsol(x0), fsol(x0)-y0);%values of x and y
    K1=h*f(x0,y0);
    K2=h*f(x0+0.5*h, y0+0.5*K1);
    K3=h*f(x0+0.5*h, y0+0.5*K2);
    K4=h*f(x0+h, y0+K3);
    y0=y0+(1/6)*(K1+2*K2+2*K3+K4);
    Yvect(1,i)=y0;
    x0=x0+h;
    Xvect(1,i)=x0;
    i=i+1;
end
plot(Xvect, Yvect)