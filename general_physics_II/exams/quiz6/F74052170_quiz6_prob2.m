%ªì©l¤Æ
x = zeros(4,1);
temp = zeros(4,1);
T = zeros(4,4);
T = [0,-1/4,1/4,-1/4;-1/4,0,1/4,1/4;1/5,1/5,0,-1/5;-1/3,1/3,-1/3,0];
c = zeros(4,1);
c = [-1/2;-1/4;0;1/3];
count = 0;

for i = 1:1:30
    count = count +1;
    temp = T*x+c;
    if(abs(x-temp)<10^(-4)) 
        break;
    end
    x=temp;
end
fprintf(1,'prob-(d):');
x
fprintf(1,'prob-(d):\ncount = %d \n',count);

error = zeros(4,1);
for i = 1:1:4
error(i,1) = abs(x(i,1)-temp(i,1));
end
error

clear all;