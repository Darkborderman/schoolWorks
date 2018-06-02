%(b)
figure(2);
xlabel('time(s)');
ylabel('Vc(V)');
R=10^(4);
C=10^(-4);
E=0;
v=0;
h=10^(-4);
for t=0:h:3
    plot(t,v,'r.');
    hold on;
    E=5*sin(20*pi*t);
    V=v+((E-v)/(R*C))*h;
    v=V;
end
clear all;
%(c)
figure(3);
xlabel('time(s)');
ylabel('Vc(V)');
R=10^(4);
C=10^(-4);
E=0;
v=0;
h=10^(-4);
for t=0:h:0.05
    plot(t,v,'r.');
    hold on;
    temp=mod(t,0.02);
    %判斷大小
    if(temp>0.01)
        E=-5;
    end
    if(temp<0.01)
        E=5;
    end
    V=v+((E-v)/(R*C))*h;
    v=V;
end
clear all;

%(d)
figure(4);
xlabel('time(ms)');
ylabel('Vc(V)');
R=100;
C=10^(-6);
E=0;
v=0;
h=10^(-2);
for t=0:h:80
    temp=mod(t,40);
    %判斷大小
    if(temp<=10)
        i=(t-temp)/40;
        E=(1/2)*(t-(i*40));
    end
    if(temp>10)
        if(temp<=30)
            i=(t-temp)/40;
            E=5-(1/2)*(t-10-(i*40));
        end
    end
    if(temp>30)
        i=(t-temp)/40;
        E=-5+(1/2)*(t-30-(i*40));
    end

    vR=E-v;
    plot(t,vR,'r.');
    hold on;
    V=v+(E-v)/R/C*h*0.001;
    v=V;
end
clear all;