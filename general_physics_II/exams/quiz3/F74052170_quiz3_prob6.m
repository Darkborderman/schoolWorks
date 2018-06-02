figure(6);
for i=(-1):(-0.001):(-50)
    h=2^(i);
    fx=1/2*(exp(1)-exp(-1));
    fxh=1/2*(exp(1-h)-exp(-1+h));
    back=(fx-fxh)/h;
    exact=1/2*(exp(1)+exp(-1));
    error=abs(back-exact);
    loglog(h,error);
    hold on;
end;