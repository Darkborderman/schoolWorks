figure(2);
hold on;
h=0.1;
for x = (-1):0.001:1
    y=(sin(2*pi*(x+h))-sin(2*pi*x))/h;
    plot(x,y,'r');
end;

h=0.01;
for x = (-1):0.001:1
    y=(sin(2*pi*(x+h))-sin(2*pi*x))/h;
    plot(x,y,'b');
end;


h=0.001;
for x = (-1):0.001:1
    y=(sin(2*pi*(x+h))-sin(2*pi*x))/h;
    plot(x,y,'g');
end;

h=0.0001;
for x = (-1):0.001:1
    y=(sin(2*pi*(x+h))-sin(2*pi*x))/h;
    plot(x,y,'y');
end;

