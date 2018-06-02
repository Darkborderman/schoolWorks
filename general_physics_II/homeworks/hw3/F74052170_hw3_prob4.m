%(b)
figure(5)
xlabel('time(ms)');
ylabel('Voltage(V)');
L=2*(10^(-3));
R=8;
C=5*(10^(-6));
h=10^(-3);
I=0;
dI=1/L;
for t=0:h:10
    Vs=cos(6*t);
    dVs=6000*(-sin(6*t));
    plot(t,Vs,'b.');
    hold on;
    plot(t,I*R,'r.');
    hold on;
    new_I=I+dI*h*0.001;
    new_dI=dI+(dVs-R*dI-I/C)/L*h*0.001;
    I=new_I;
    dI=new_dI;
end
clear all;

%(c)
figure(6)
xlabel('time(ms)');
ylabel('Voltage(V)');
L=2*(10^(-3));
R=8;
C=5*(10^(-6));
h=10^(-3);
I=0;
dI=1/L;
for t=0:h:10
    Vs=cos(10*t);
    dVs=10000*(-sin(10*t));
    plot(t,Vs,'b.');
    hold on;
    plot(t,I*R,'r.');
    hold on;
    new_I=I+dI*h*0.001;
    new_dI=dI+(dVs-R*dI-I/C)/L*h*0.001;
    I=new_I;
    dI=new_dI;
end
clear all;

%(c)
figure(7)
xlabel('time(ms)');
ylabel('Voltage(V)');
L=2*(10^(-3));
R=8;
C=5*(10^(-6));
h=10^(-3);
I=0;
dI=1/L;
for t=0:h:10
    Vs=cos(20*t);
    dVs=20000*(-sin(20*t));
    plot(t,Vs,'b.');
    hold on;
    plot(t,I*R,'r.');
    hold on;
    new_I=I+dI*h*0.001;
    new_dI=dI+(dVs-R*dI-I/C)/L*h*0.001;
    I=new_I;
    dI=new_dI;
end
clear all;

fprintf(1,'Prob4: Vs(blue) VR(red)\n');