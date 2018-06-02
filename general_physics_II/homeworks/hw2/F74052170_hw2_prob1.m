%(i)
%Simpson¡¦s Method
a=0;
b=pi;
i=8;
    h=10^(-i);
    n=(b-a)/h;
    sum=0;
    y1=0;
    y2=0;
    for j=1:1:(n/2)
        t=1/((1+2*sin(a+(2*j-1)*h))^(1/2));
        y1 =  y1+ t;
    end
    for k=1:1:(n/2-1)
        t=1/((1+2*sin(a+(2*k)*h))^(1/2));
        y2 =  y2+ t;
    end
    sum = (h/3)*((1/((1+2*sin(a))^(1/2)))+(1/((1+2*sin(b))^(1/2)))+4*y1+2*y2);
    fprintf(1,'(i) %.7f\n',sum);
    
%(ii)
%Simpson¡¦s Method

a=0;
b=1;
i=5;
    h=10^(-i);
    n=(b-a)/h;
    sum=0;
    y1=0;
    y2=0;
    for j=1:1:(n/2)
        t=(sin(50*(a+(2*j-1)*h)))/(1+(a+(2*j-1)*h)^2);
        y1 =  y1+ t;
    end
    for k=1:1:(n/2-1)
        t=(sin(50*(a+(2*k)*h)))/(1+(a+(2*k)*h)^2);
        y2 =  y2+ t;
    end
    sum = (h/3)*(((sin(50*a))/(1+a^2))+((sin(50*b))/(1+b^2))+4*y1+2*y2);
    fprintf(1,'(ii) %.9f\n',sum);
    
    clear all;