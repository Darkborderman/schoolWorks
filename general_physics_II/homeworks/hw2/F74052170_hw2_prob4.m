%prob(a)
figure(1);hold on;
for x=-4:0.01:4
    y=(1/2)+(x/4)-x*sin(x)-(1/2)*cos(2*x);
    plot(x,y,'b.-');
    hold on;
end

%推斷出在1~2和-2~-4間
%Newton Raphson Method
x=1;
for i = 1:1:7
    y1 = (1/2)+(x/4)-x*sin(x)-(1/2)*cos(2*x);
    y2 = (1/4)-sin(x)+sin(2*x)-x*cos(x);
    p=x-(y1/y2);
    x = p;
    fprintf(1,'The smallest positive root of Prob.4(a) is %.7f\n', x);
    %fprintf(1,'y = %.10f\n', (1/2)+(x/4)-x*sin(x)-(1/2)*cos(2*x));
end

x=-4;
for i = 1:1:5
    y1 = (1/2)+(x/4)-x*sin(x)-(1/2)*cos(2*x);
    y2 = (1/4)-sin(x)+sin(2*x)-x*cos(x);
    p=x-(y1/y2);
    x = p;
    fprintf(1,'The largest negative root of Prob.4(a) is %.8f\n', x);
    %fprintf(1,'y = %.10f\n', (1/2)+(x/4)-x*sin(x)-(1/2)*cos(2*x));
end

%prob(b)
figure(2);
for x=-4:0.01:1
    y=exp(3*x)-27*(x^6)+27*(x^4)*exp(x)-9*(x^2)*exp(2*x);
    plot(x,y,'r.-');
    hold on;
end
x=0.9;
for i = 1:1:25
    y1 = exp(3*x)-27*(x^6)+27*(x^4)*exp(x)-9*(x^2)*exp(2*x);
    y2 =3*exp(3*x)-162*(x^5)+108*(x^3)*exp(x)+27*(x^4)*exp(x)-18*x*exp(2*x)-18*(x^2)*exp(2*x) ;
    p=x-(y1/y2);
    x = p;
    fprintf(1,'The largest positive root of Prob.4(b) is %.8f\n', x);
    %fprintf(1,'y = %.15f\n', exp(3*x)-27*(x^6)+27*(x^4)*exp(x)-9*(x^2)*exp(2*x));
end

x=-0.45;
for i = 1:1:25
    y1 = exp(3*x)-27*(x^6)+27*(x^4)*exp(x)-9*(x^2)*exp(2*x);
    y2 =3*exp(3*x)-162*(x^5)+108*(x^3)*exp(x)+27*(x^4)*exp(x)-18*x*exp(2*x)-18*(x^2)*exp(2*x) ;
    p=x-(y1/y2);
    x = p;
    fprintf(1,'The largest negative root of Prob.4(b) is %.8f\n', x);
    %fprintf(1,'y = %.15f\n', exp(3*x)-27*(x^6)+27*(x^4)*exp(x)-9*(x^2)*exp(2*x));
end
clear all;