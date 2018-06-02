figure(4);
h=0.1;
for x=-1:0.001:1
    y1=sin(2*pi*(x+h));
    y2=sin(2*pi*(x-h));
    y=(y1-y2)/2/h;
    plot(x,y,'r');
    hold on;
end;

h=0.01;
for x=-1:0.001:1
    y1=sin(2*pi*(x+h));
    y2=sin(2*pi*(x-h));
    y=(y1-y2)/2/h;
    plot(x,y,'b');
    hold on;
end;

h=0.001;
for x=-1:0.001:1
    y1=sin(2*pi*(x+h));
    y2=sin(2*pi*(x-h));
    y=(y1-y2)/2/h;
    plot(x,y,'m');
    hold on;
end;

h=0.0001;
for x=-1:0.001:1
    y1=sin(2*pi*(x+h));
    y2=sin(2*pi*(x-h));
    y=(y1-y2)/2/h;
    plot(x,y,'y');
    hold on;
end;