figure(1)
for x=-0.5:0.001:-0.4
    y=3*(x^2)-exp(x);
    plot(x,y);
    hold on;
end

a=-0.470;
b=-0.450;

for i=1:1:10
    y1=3*(a^2)-exp(a);
    y2=3*(b^2)-exp(b);
    c=(a+b)/2;
    y3=3*(c^2)-exp(c);
    if(y1*y3<0)
        b=c;
    end
    if(y1*y3>0)
        a=c;
    end
    if(y3==0)
        fprintf(1,'yes:%.6f\n',c);
    end
    fprintf(1,'Answer1-a=%.6f\n', c);
    fprintf(1,'y:%.16f\n',y3);
end

clear all;

figure(2)
for x=0.9:0.001:1
    y=3*(x^2)-exp(x);
    plot(x,y);
    hold on;
end

a=0.9;
for i=1:1:10
    y1=3*(a^2)-exp(a);
    y2=6*a-exp(a);
    a=a-(y1/y2);
    fprintf(1,'Answer1-b=%.6f\n', a);
    fprintf(1,'y:%.6f\n', 3*(a^2)-exp(a));
end

clear all;