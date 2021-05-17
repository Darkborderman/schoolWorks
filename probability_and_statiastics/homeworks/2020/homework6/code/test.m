fxy=eye(1001,101);
for x=1:101;
    for y=1:1001;
    fxy(y,x)=HW6_1_fun(x-1,y+999,50,1500,20,200,0);
    end
end
imagesc(a,b,fxy)
axis xy;%可以讓y軸在我們常見的地方
colorbar