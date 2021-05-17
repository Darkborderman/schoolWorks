%data1
x=0:1:100;
y=1000:1:2000;
[X,Y]=meshgrid(x,y);
Z1=HW6_1_fun(X,Y,25,1250,30,300,0);
Z2=HW6_1_fun(X,Y,75,1750,30,300,0);
imagesc(x,y,Z1)%印出Distribution1的圖
axis xy;
title('Case 1,Distribution 1')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
figure%印出Distribution2的圖
imagesc(x,y,Z2)
axis xy;
title('Case 1,Distribution 2')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
MAX1=max(max(Z1(:)),max(Z2(:)));
Z3=eye(1001,101);
for i=1:1001;%建立Z3，在兩者差異小於0.005*MAX1時即為Decision point，設為1(同值印出同東西)
    for j=1:101
        a=abs(Z2(i,j)-Z1(i,j));
        if a<MAX1*0.005
            Z3(i,j)=1;
        else
            Z3(i,j)=0;
        end
    end
end
figure%印出Decision boundaries的圖
imagesc(x,y,Z3)
title('Case 1,Decision boundaries')
xlabel('Random variable X')
ylabel('Random variable Y')
axis xy;
colorbar

%data2
Z4=HW6_1_fun(X,Y,25,1250,20,200,0);
Z5=HW6_1_fun(X,Y,75,1750,30,300,0);
figure%印出Distribution1的圖
imagesc(x,y,Z4)
axis xy;
title('Case 2,Distribution 1')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
figure%印出Distribution2的圖
imagesc(x,y,Z5)
axis xy;
title('Case 2,Distribution 2')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
MAX2=max(max(Z4(:)),max(Z5(:)));
Z6=eye(1001,101);
for i=1:1001;%建立Z6，在兩者差異小於0.005*MAX2時即為Decision point，設為1(同值印出同東西)
    for j=1:101
        a=abs(Z4(i,j)-Z5(i,j));
        if a<MAX2*0.005
            Z6(i,j)=1;
        else
            Z6(i,j)=0;
        end
    end
end
figure%印出Decision boundaries的圖
imagesc(x,y,Z6)
axis xy;
title('Case 2,Decision boundaries')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar