%Trapezoid Method
a=0;
b=2;
for i=1:1:7
    h=10^(-i);
    n=(b-a)/h;
    int = 0;
    for j=1:1:n-1
        temp =exp(-((a+j*h)^2));
        int = int +temp;
    end
    ans = (h/2)*(exp(-(a*a))+exp(-(b*b))+(2*int));
    fprintf('Trapezoid Method : h = %.10f , ans = %.8f\n ', h ,ans);
end

%Simpson¡¦s Method

a=0;
b=2;
for i=1:1:7
    h=10^(-i);
    n=(b-a)/h;
    A = 0;
    B = 0;
    for j=1:1:(n/2)
        temp =exp(-((a+(2*j-1)*h)^2));
         A = A + temp;
    end
    for j=1:1:(n/2-1)
         temp =exp(-((a+(2*j)*h)^2));
         B = B + temp;
    end
    ans = (h/3) * (exp(-(a*a))+exp(-(b*b))+ 4*A + 2*B);
    fprintf('Simpson¡¦s Method : h = %.10f , ans = %.8f\n ', h ,ans);
end