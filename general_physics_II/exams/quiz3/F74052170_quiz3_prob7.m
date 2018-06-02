figure(7);
for i=(-1):(-0.001):(-50)
    h=2^(i);
    f1=1/2*(exp(1+h)-exp(-1-h));
    f2=1/2*(exp(1-h)-exp(-1+h));
    cen=(f1-f2)/2/h;
    exact=1/2*(exp(1)+exp(-1));
    error=abs(cen-exact);
    loglog(h,error);
    hold on;
end;