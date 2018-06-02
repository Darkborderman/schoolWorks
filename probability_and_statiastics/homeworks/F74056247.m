%%1(1)
h=0.1;
x=0:0.1:0.5;
y=1:1:7;
dy=1:1:7;
ans=repmat(2,2);
for i=1:5
    dy(i)=x(i)*x(i)+y(i)*y(i);
    y(i+1)=y(i)+h*dy(i);
end

for j=1:6
    ans(1,j)=x(j);
    ans(2,j)=y(j);
end

fprintf('1(a)\n x= ');
for j=1:6
    fprintf('%.4f ',ans(1,j));
end
fprintf('\n y= ');
for j=1:6
    fprintf('%.4f ',ans(2,j));
end
fprintf('\n\n');
clear;

%%1(2)
h=0.1;
x=0:0.1:0.5;
y=-2:1:6;
dy=1:1:7;
ddy=-2:1:7;
ans=repmat(2,2);
for i=1:5
    ddy(i)=4*dy(i)-4*y(i);
    dy(i+1)=dy(i)+h*ddy(i);
    y(i+1)=y(i)+h*dy(i);
end

for j=1:6
    ans(1,j)=x(j);
    ans(2,j)=y(j);
end
fprintf('1(b)\n x= ');
for j=1:6
    fprintf('%.4f ',ans(1,j));
end
fprintf('\n y= ');
for j=1:6
    fprintf('%.4f ',ans(2,j));
end
fprintf('\n\n');
clear;

%%2
ans=repmat(2,2);
h=0.1;
xn=0:h:0.5;
num=numel(xn);

x=sym('x');
y=sym('y');
f = 2*x-3*y+1;
RK=zeros(1,num);
yn=zeros(1,num);
RK(1)=1;
for i=1:3
    k1=subs(f,[x,y],[xn(i),RK(i)]);
    k2=subs(f,[x,y],[xn(i)+0.5*h,RK(i)+0.5*h*k1]);
    k3=subs(f,[x,y],[xn(i)+0.5*h,RK(i)+0.5*h*k2]);
    k4=subs(f,[x,y],[xn(i)+h,RK(i)+h*k3]);
    RK(i+1)=RK(i)+h*(k1+2*k2+2*k3+k4)/6;
    
    yn(i)=subs(f,[x,y],[xn(i),RK(i)]);
end

for i=4:(num-1)
    yn(i)=subs(f,[x,y],[xn(i),RK(i)]); 
    ynstar= RK(i) + h*(55*yn(i)-59*yn(i-1)+37*yn(i-2)-9*yn(i-3))/24;  %Adams-Bashforth
    yn(i+1)=subs(f,[x,y],[xn(i+1),ynstar]);
    RK(i+1)=RK(i)+h*(9*yn(i+1)+19*yn(i)-5*yn(i-1)+yn(i-2))/24; %Adams-Moulton
end

for j=1:6
    ans(1,j)=xn(j);
    ans(2,j)=RK(j);
end
fprintf('2(a)\n x= ');
for j=1:6
    fprintf('%.4f ',ans(1,j));
end
fprintf('\n y= ');
for j=1:6
    fprintf('%.4f ',ans(2,j));
end
fprintf('\n\n');
clear;