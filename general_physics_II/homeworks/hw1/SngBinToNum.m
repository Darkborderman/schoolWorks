function ans = SngBinToNum(x)
%§PÂ_¥¿­t
s = 1;
if(x(1) == 1) 
    s=-1;
end
c=0;
%Exponent
for i=2:9
    t=x(i)*2.^(9-i);
    c=c+t;
end
f=0;
%(Mantissa
for i=10:32
    t=x(i)*((0.5).^(i-9));
    f=f+t;
end

ans = s*(2^(c-127))*(1+f);
return