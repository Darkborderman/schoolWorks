%(b)
Ms=2*10^(30);%mass of sun
G=6.67*10^(-11);
r=1.5*10^(11);
V=((G*Ms)/r)^(1/2);
fprintf(1,'Prob5-(b): vc=%.5f(m/s)\n',V);

%(c)
figure(8);
hold on;
xlabel('x(m)');
ylabel('y(m)');
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2);
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(x,y,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end

figure(9);
hold on;
xlabel('t(s)');
ylabel('y(m)');
x=r;
dx=0;
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(i,x,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end

figure(10);
hold on;
xlabel('t(s)');
ylabel('y(m)');
y=0;
dy=((G*Ms)/r)^(1/2);
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(i,y,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end
%(d)
figure(11);
hold on;
xlabel('x(m)');
ylabel('y(m)');
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2)*(0.7);
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(x,y,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end

figure(12);
hold on;
xlabel('t(s)');
ylabel('x(m)');
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2)*(0.7);
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(i,x,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end

figure(13);
hold on;
xlabel('t(s)');
ylabel('y(m)');
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2)*(0.7);
h=10^(4);
for i=0:h:3.3*10^(7)
    plot(i,y,'r.');
    hold on;
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end

%(e)
Ms=2*10^(30);%mass of sun
G=6.67*10^(-11);
r=1.5*10^(11);
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2)*(0.7);
h=10^(4);
flag=0;%當標記
first=0;
second=0;
for i=0:h:3.3*10^(7)
    if flag==0
        if y==0
            first=x;
            time1=i;
            flag=flag+1;
        end
    end
    if flag==1
        if x~=first
            if y<10^(-12)
                second=x;
                time2=i;
                flag=flag+1;
            end
        end
    end
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end
a=(first-second)/2;
T=(time2-time1)*2;
fprintf(1,'Prob5-(e): semi-major axis=%e(m)\n',a);
fprintf(1,'Prob5-(e): T=%e(s/個)\n',T);

%Verify
Ms=2*10^(30);%mass of sun
G=6.67*10^(-11);
r=1.5*10^(11);
x=r;
dx=0;
y=0;
dy=((G*Ms)/r)^(1/2)*(0.7);
h=10^(4);
%焦點
focus1=0;
center=second+a;
focus2=center+(center-focus1);
for i=0:h:3.3*10^(7)
    total=((x-focus1)^2+y^2)^(1/2)+((x-focus2)^2+y^2)^(1/2);
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end
2*a;
%測試
%(f)
figure(14);
xlabel('R^3');
ylabel('T^2');
hold on;
Ms=2*10^(30);%mass of sun
G=6.67*10^(-11);
r=1.5*10^(11);
h=10^(4);
for k=1/5:0.001:1
    %每次都要初始化一次
    flag=0;%當標記
    dy=((G*Ms)/r)^(1/2)*k;
    x=r;
    dx=0;
    y=0;
for i=0:h:3.3*10^(7)
    if flag==0
        if y==0
            first=x;
            time1=i;
            flag=flag+1;
        end
    end
    if flag==1
        if x~=first
            if y<10^(-12)
                second=x;
                time2=i;
                flag=flag+1;
                a=(first-second)/2;
                T=(time2-time1)*2;
            end
        end
    end
    temp1=x+dx*h;
    temp2=dx+((-G*Ms*x)/((x^2+y^2)^(3/2)))*h;
    x=temp1;
    dx=temp2;
    temp1=y+dy*h;
    temp2=dy+((-G*Ms*y)/((x^2+y^2)^(3/2)))*h;
    y=temp1;
    dy=temp2;
end
    a=(first-second)/2;
    T=(time2-time1)*2;
    plot(a^(3),T^(2),'r.');
    hold on;
end
clear all;