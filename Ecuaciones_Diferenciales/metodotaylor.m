clear all;
clc;
pkg load symbolic
syms t y

dydt=(2/t)*y+(t^2)*(e^t)
Yprimay=diff(dydt,y);
Yprimat=diff(dydt,t);

t=input('\n Enter initial value of x or t i.e. x0: '); %example x0=0
y=input('\n Enter initial value of y i.e. y0: '); %example y0=0.5
tn=input('\n Enter the final value of x: ');% where we need to find the value of y example x=2
h=input('\n Enter the step length h: '); %example h=0.2
fprintf('\n x        y'); 

a=tn-t;
l=a/h;
Yvect=zeros(1,l+1);
Tvect=zeros(1,l+1);
Yvect(1,1)=y;
Tvect(1,1)=t;

i=2;
while t<=tn
    fprintf('\n%4.5f   %4.5f ',t,y);%values of x and y 
    f=subs(dydt,y,t);  
    f=eval(f);
    ft=subs(Yprimat,y,t);
    ft=eval(ft);
    fy=subs(Yprimay,y,t);
    fy=eval(fy);
    Yprimaprima=ft+fy*f;
    Y1=y+h*f+((h^2)/2)*Yprimaprima;
    y=Y1;
    Yvect(1,i)=y;
    t=t+h;
    Tvect(1,i)=t;
    i=i+1;

end
clc
Yvect
Tvect
plot(Tvect, Yvect)
