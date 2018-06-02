%(a)
figure(1);
xlabel('time(s)');
ylabel('x(m)');
m=1.2*(10^3);
k=58*(10^3);
B=4*(10^3);
x=-0.1;
v=0;
h=0.001;
flag=0;%·í¼Ð°O
for t=0:h:5
    plot(t,x,'r.');
    hold on;
    X=x+(v*h);
    V=v-(1/m)*(B*v+k*x)*h;
    if(flag==0)
        if(X<x)
            max=t;
            flag=1;
        end
    end
    if(flag==1)
        if(X>x)
            min=t;
            flag=2;
        end
    end
    x=X;
    v=V;
end
%(b)
T=2*(min-max);
fprintf(1,'Prob2: f=%.4f(Hz)\n',T^(-1));
clear all;