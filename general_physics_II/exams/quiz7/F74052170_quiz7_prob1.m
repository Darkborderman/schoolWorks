%proba
figure(1);
E = 5;
R = 50*10^3;
C = 20*10^(-6);
h=0.01;
V = 0.5; %t=0
fprintf(1,'prob1-(a) : Euler Method');
for t=0:h:30
    plot(t,V);
    hold on;
    dv=(1/C/R)*(E-V);
    V_new = V + dv*h;
    V = V_new;
end

%probb
E = 5;
R = 50*10^3;
C = 20*10^(-6);
V = 0.5; %t=0
h=10^(-5);
for t=0:h:0.5-h
    dv=(1/C/R)*(E-V);
    V_new = V + dv*h;
    V = V_new;
end
fprintf(1,'prob1-(b) : answer = %.5f\nprob1-(b) : precision = 4 significant digits\nprob1-(b) : step size = %.6f\n',V,h);

%probc
E = 5;
R = 50*10^3;
C = 20*10^(-6);
V = 0.5; %t=0
h=10^(-5);
for t=0:h:3
    if(abs(V-3.5000)<10^(-4))
        fprintf(1,'prob1-(c) : t=%.4f\nprob1-(c) : precision = 3 significant digits\nprob1-(c) : V=%.3f\n',t,V);
        break;
    end
    dv=(1/C/R)*(E-V);
    V_new = V + dv*h;
    V = V_new;
end
clear all;
