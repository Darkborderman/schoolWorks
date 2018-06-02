%Monte Carlo Integration

a=2;b=1;c=3;
count=0;
j=6;
    n=10^(j);
for i = 1:1:n
    x=rand(1)*a;
    y=rand(1)*b;
    z=rand(1)*c;
    func = x^2/4+y^2+z^2/9;
    if(func<=1)
        count = count+1;
    end
end
%體積
vol=2*1*3*8*(count/n);
%八等分
fprintf(1,'A total of %d random points are used; the volume of the ellipsoid is %.8f\n',n, vol);

clear all;