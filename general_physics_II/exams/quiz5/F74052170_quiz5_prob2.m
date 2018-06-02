figure(3)
for x=-2:0.001:0
    y=	x+3*cos(x);
    plot(x,y);
    hold on;
end

a=-1.5;
for i=1:1:10
    y1=a+3*cos(a);
    y2=1-3*sin(a);
    a=a-(y1/y2);
    fprintf(1,'Answer2-a=%.6f\n', a);
    fprintf(1,'y:%.6f\n', a+3*cos(a));
end

clear;

figure(4)
for x=-10:0.1:10
    y=	x+3*cos(x);
    plot(x,y);
    hold on;
end

a=2.5;
b=3;
for i = 1:1:10
    y2=b+3*cos(b);
    y1=a+3*cos(a);
    c=b-((y2*(b-a))/(y2-y1));
    y3=c+3*cos(c);
    fprintf(1,'Answer2-b=%.6f\n', c);
    fprintf(1,'y:%.6f\n', y3);
    a=b;
    b=c;
end
