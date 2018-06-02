%第a小題
figure(4)
xlabel('t(s)');
ylabel('v(m/s)');
hold on;
x = 0:0.001:25;
y=(-20)*exp(-0.01*(x.^2)).*sin(20*pi.*x+2*pi/5);
plot(x,y);
clear;
%第b小題
figure(5);
xlabel('t(s)');
ylabel('F(N)');
hold on;
h=0.000001;
x = 0:0.001:25;
%Cental Difference
y1=(-20)*exp(-0.01*((x+h).^2)).*sin(20*pi.*(x+h)+2*pi/5);
y2=(-20)*exp(-0.01*((x-h).^2)).*sin(20*pi.*(x-h)+2*pi/5);
y=5*(y1-y2)/2/h;
plot(x,y);
%第c小題
h=0.000001;
x =8;
%Central Difference
y1=(-20)*exp(-0.01*((x+h).^2)).*sin(20*pi.*(x+h)+2*pi/5);
y2=(-20)*exp(-0.01*((x-h).^2)).*sin(20*pi.*(x-h)+2*pi/5);
y=5*(y1-y2)/2/h;
fprintf('F(8) is %.6f', y);
clear
