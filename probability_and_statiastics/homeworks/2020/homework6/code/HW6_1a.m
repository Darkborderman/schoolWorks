x=0:1:100;
y=1000:1:2000;
[X,Y]=meshgrid(x,y);
a=[0 100];
b=[1000 2000];
%data1
Z1=HW6_1_fun(X,Y,50,1500,20,200,0);
imagesc(a,b,Z1)
axis xy;%可以讓y軸在我們常見的地方
title('[𝜇x, 𝜎x, 𝜇y, 𝜎y, 𝜌] = [50, 20, 1500, 200, 0]')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
%data2
figure
Z2=HW6_1_fun(X,Y,50,1500,20,200,0.3);
imagesc(x,y,Z2)
axis xy;
title('[𝜇x, 𝜎x, 𝜇y, 𝜎y, 𝜌] = [50, 20, 1500, 200, 0.3]')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
%data3
figure
Z3=HW6_1_fun(X,Y,50,1500,20,200,0.8);
imagesc(x,y,Z3)
axis xy;
title('[𝜇x, 𝜎x, 𝜇y, 𝜎y, 𝜌] = [50, 20, 1500, 200, 0.8]')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar
%data4
figure
Z4=HW6_1_fun(X,Y,50,1500,20,200,-0.8);
imagesc(x,y,Z4)
axis xy;
title('[𝜇x, 𝜎x, 𝜇y, 𝜎y, 𝜌] = [50, 20, 1500, 200, -0.8]')
xlabel('Random variable X')
ylabel('Random variable Y')
colorbar