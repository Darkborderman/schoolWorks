A = zeros(3,3);
C=zeros(3,3);
A=[0,2/3,1/3;2/9,0,4/9;1/6,2/3,0];
C=[5/6;0;0];
X=zeros(3,1);
temp=zeros(3,1);
time=40;
fprintf(1,'Prob1: Jacobi Method\n');
for i=0:1:time
    temp = A*X + C;
    if(abs(X-temp)<=10^(-4))
        break;
    end
    X=temp;
end
fprintf(1,'Prob1: iterative times: %d\n',i);
fprintf(1,'Prob1: precision: 小數點後4位\n');
fprintf(1,'Prob1: %.5f(A)\n',X(3,1)-X(2,1));

clear all;