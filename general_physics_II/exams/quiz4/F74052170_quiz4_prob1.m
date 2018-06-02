%1-1
%(Riemman Sum
figure(1);
a=1/4;
b=1/2;
ans=1-(((2)^(1/2))/2);
for i=1:1:7
    h=10^(-i);
    n=(b-a)/h;
    int = 0;
    for j=1:1:n
        temp = cos(pi*(a+(j*h)));
        int = int + temp;
    end
    int = int*pi*h;
    error = ans- int;
    error = abs(error);
    loglog(h,error,'r.');
    hold on;
end
%Trapezoid method
for i=1:1:7
    h=10^(-i);
    n=(b-a)/h;
    int = 0;
    for j=1:1:n-1
        temp = cos(pi*(a+(j*h)));
        int = int +temp;
    end
    int = int*pi*h;
    int = int+(h/2)*(pi*(cos(pi*a)+cos(pi*b)));
    error = ans- int;
    error = abs(error);
    loglog(h,error,'b.');
    hold on;
end
clear;