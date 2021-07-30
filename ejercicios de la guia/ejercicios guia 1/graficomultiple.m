x=-2:0.1:2;
y1=x.*cos(x.^2)
plot(x,y1)
hold on
y2=e.^x
plot (x,y2)
hold off