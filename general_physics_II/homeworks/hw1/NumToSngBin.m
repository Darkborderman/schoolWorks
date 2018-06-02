function ans = NumToSngBin(x)
array = zeros(1,32);
%判斷正負
if (x<0)
    array(1,1) = 1;
end
%Exponent
X=abs(x);
num = 0;
X = fix(X);%取整數
while( X > 1)
    X = X/2;
    X = fix(X);
    num = num+1;
end 
c=num+127;
for i = 2:9
    array(1,11-i) = mod(c,2);
    c =fix (c/2);
end
%(Mantissa
Y = (abs(x)/(2^num))-1;
for i = 10:32
    array(1,i) = fix(Y*2);
    Y=mod(Y*2,1);
end

ans = array;
return